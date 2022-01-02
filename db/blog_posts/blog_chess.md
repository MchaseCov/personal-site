I recently created an application that allows two players to play Chess together online. I recently have been excited by the [Hotwire](https://hotwired.dev/) umbrella of frameworks for Rails and have been thinking of creative ways to use it. This project was done as a personal exploration to get some more practice with Active Record and model testing (minitest in this case) but with a more "traditional Ruby" feel!

## Where can I find this project?

To view the repo on Github:
https://github.com/MchaseCov/multiplayer-chess

To view the project on Heroku:
_(If nobody has visited the website recently, the dyno may be asleep and take about 10 seconds to load for the first time while it wakes up. This is normal!)_
https://multiplayer-chess-mcc.herokuapp.com/

## Summary Of Features

- Users can challenge others to games of chess
- Chess games auto assemble their pieces and squares during the creation
- Chess games track turn history
- Chess games have a chat for spectators and players
- Broadcast live updates when the board is updated or a chat message is sent
- Chess game auto updates instantly for all spectators
- Interactive GUI to select your square to move a piece
- Safeguards players from moving a king into an illegal, dangerous position
- Alerts players when they are facing check
- Game automatically declares a win if a player has checkmate
- Players can concede or agree to a draw

## Challenges and Problem Solving:

Creating a game with SQL/Active Record is a bit different and requires a lot of thought and refactoring to ensure the performance and playablity are acceptable. Here's a list of challenges and problems I solved and some insight as the decisions I made:

- **How do I make a Chess game in rails, like at all?**

  I opted to do this by creating a "game" model which acts as the parent shell for anything that needs to be attached to each other. I then split the actual game logic between "squares" and "pieces". My approach was to treat the game as a set of relationships between pieces and squares in their respective game. This means that unlike more traditional Ruby approaches of chess, my pieces may seem to have more logic than others that keep it inside of a "game" file. While some methods could be refactored out of the piece and model controller into the game and squares model, I felt that the benefits of preserving and passing certain variables and keeping the code overall more DRY is worth it.

- **How do I make an "edit form" for a chess board?**

  My "edit" page for a respective piece is actually to load the board again but any "valid moves" are wrapped inside of a button to the "create" path of the respective piece. It also has some fancy styling like a blue overlay and ghost piece to help you make your choice. Interestingly, due to my STI approach, I had trouble getting my button to work the traditional way and had to write it in the drawn out "controller/action/params" way.

- **How does a piece know where to go?**

  This isn't really something I had an answer to, but rather I had a dynamic approach that changed through the process. I knew I wanted to do something with "rows" and "columns", but wasn't really sure how that would work in practice.

  My first piece prototype was the pawn, and looked like this.

```ruby
    first_move = game_squares.where(row: (color ? current_row - 1 : current_row + 1), column: current_col)
                             .where(piece: { id: nil })

    return first_move if first_move.empty? || has_moved == true

    first_move.or(game_squares.where(row: (color ? current_row - 2 : current_row + 2), column: current_col)
                              .where(piece: { id: nil }))
```

This does work for a pawn well enough, but it has a lot of logic to it. I wasn't really sure if this was something that would be viable. I decided to try out the Knight class next, as it would be a bit simple and allow me to think of the idea of "collecting squares" a bit more.

```ruby
  def valid_moves
    possible_forward_moves
  end

  def possible_forward_moves
    moveset = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
    range = moveset.map { |r, h| [r + current_row, h + current_col] }
    moves = []
    range.each do |r|
      moves << game_squares.where.not(piece: { color: color })
                           .or(game_squares.where(piece: { id: nil }))
                           .find_by(row: r[0], column: r[1])
    end
    moves
  end
```

And as I made this I had a realization. I made a moveset out of necessity, I needed some way to pass "Up 2, right 1" into a loop to collect those options. But I realized that I could do this for any piece I wanted to. If its a piece like a Bishop or Rook, its the exact same method just I would have to loop more to continue pushing forward.

My final solution to this can be found in the "SQUARE GATHERING & VALIDATION" section of models/piece.rb, but essentially I created methods that allow me to loop through squares. I open this method by either requesting for all squares that match, or requesting a pathway (a relationship of squares that are tied together, not just loose matches). I also make use of blocks to pass in to say how I actually want to filter. For instance, a normal moveset filters based on keeping empty and opponent-occupied squares, but leaves out those that are controlled by a friendly. And when they do bump into an obstacle, they will break their loop of that direction and continue to check the next moveset.

(This is just a piece of the puzzle, if you want to see how this works in context you gotta go check [piece.rb](https://github.com/MchaseCov/multiplayer-chess/blob/main/app/models/piece.rb#L82))

```ruby
  # An "initialize" for each moveset, [i, i, i], passed by collect_valid_moves or collect_path_to.
  # Grabs squares in the row and column direction of the respective first two numbers.
  # Third number is amount of times to loop. BLOCK FILTERS break the loop early.
  def evaluate_moveset(row_direction, col_direction, amount_to_check, method_to_call, inclusion = nil)
    @valid = [inclusion]
    @row_direction = row_direction
    @col_direction = col_direction
    @row_count = @col_count = 0
    catch(:stop) do
      amount_to_check.times do
        validate_square_for_movement(method_to_call)
      end
    end
    @valid.compact
  end

  # Grabs the next appropriate square in the loop and plugs it into the user's chosen BLOCK FILTER
  def validate_square_for_movement(method_to_call)
    @row_count += @row_direction
    @col_count += @col_direction
    square_to_validate = game_squares.find_by(row: (current_row + @row_count), column: (current_col + @col_count))
    method_to_call.call(self, square_to_validate)
  end
```

**How does the king know theyre safe?**

My commit history tells more details of the story as I slowly build and refactor and keep pushing forward. I used the same logic of collecting moves for king safety as well. Originally king safety was done by querying the enemy team for all of their possible moves and then removing those from the king movement pool. This sounded good in my head but it led to issues such as:

- Soft locking during discovered attack leading to immediate checkmate
- Discovered attacks also give an unsatisfying lack of response and the player may not realize they are in check until they cannot move certain pieces.
- Unneeded database querying, asking a rook in the corner if there is a king in its range is a waste of time.
  My solution then changed to actually collect the King's possible moves (empty squares or squares with an enemy). I then place a "decoy king" on each of those tiles. I then ask those decoy kings questions like "using a knight moveset, could you attack a knight from this spot?" "Using a Rook moveset, could you attack a Rook or Queen from this spot?".
  If any of those questions are answered with a yes, then that means the enemy could attack back if the king moved to this spot and therefore is not a safe square to consider.

**How does the game know its over?**

When you line of sight a king, it verifies this by doing that same method as listed above. Every turn ends with asking the king "hey, do you feel safe right now?". If the king is not save (If you put your own king in danger, the turn gets rolled back. This is only for enemy kings), then the board flips "check" to true and then the game collects the squares that the king senses danger from (Remember, we can collect path relationships not just loose squares) and marks them as urgent. The urgent marking allows for easy querying to say the game is over if these two condtions cannot be met by the defending team:

1. The king must be able to safely get out of the "urgent squares". They can only do this if the square they are moving to is ALSO safe. There is also special consideration for making sure the squares behind a king from an enemy with range, like a rook down a row, are not considered safe either since the king cannot hide behind itself.
2. OR: A friendly piece is able to make a move that ends with them blocking line of sight or taking the enemy that is checking (if just one). This is done by asking the friendly team if any pieces are able to make a move to a "urgent flagged" square. By flagging the square as urgent, we can do all of this!

If neither of these conditions can be met, the game is considered over and lost.

## Whats missing?

- En Passante: I decided to leave this out as my chess pieces are based on an Single Table Inheritence model and I felt that the best way to track a pawn en passante is to flag them as such in their record, but this would feel tacked on and cluttered to have a 'nil' column on all other pieces just to make this happen.aded with Hotwire appending alongside a stimulus controller that tracks if the user has scrolled to the bottom of the page.

- Automatic draws: The only automatic draw is when a player only has one king remaining and no legal moves. To reduce database querying, as querying the king already takes a large check, I decided to instead implement a concede or agreed draw button. There is also no draw for repeating moves as it seems that the rule for a game ending after 3 turns are repeated is something that has to be agreed to as well.

- Not a missing feature, but I believe that more efficiency is to be found by changing the way that checkmate is queried and calculating movements from the perspective of urgent squares, rather than the pieces needing to reach them.

## Closing Thoughts

I had a lot of fun with this project and I came a lot further than I thought I would. The chess game itself is responsive for all the querying it makes. While I dont think this is the practical way to build a game of chess, due to the querying that must be done, I had a lot of fun doing it and it does make use of really neat tools like Hotwire to live broadcast the game for spectators!!
