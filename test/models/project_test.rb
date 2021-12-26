require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  include TestModelValidations
  # test_validates_presence_of
  # test_validates_uniqueness_of
  #
  test_validates_presence_of :title, :screenshot_url, :thumb_icon, :full_desc, :small_desc, :repo_url, :feature_list

  test 'icon can begin with fas, far or fab and space' do
    valid = ['fas ', 'far ', 'fab ']
    valid.each do |prefix|
      project = Project.new(thumb_icon: prefix)
      project.save
      assert project.errors[:thumb_icon].empty?
    end
  end
  test 'icon cannot be anything except fas, far or fab and space' do
    invalid = %w[foo bar fab]
    invalid.each do |prefix|
      project = Project.new(thumb_icon: prefix)
      project.save
      assert_not project.errors[:thumb_icon].empty?
    end
  end
  test 'urls must begin with http to ensure URL' do
    urls = %w[http https https://]
    urls.each do |url|
      project = Project.new(screenshot_url: url, repo_url: url, live_url: url)
      project.save
      assert project.errors[:screenshot_url].empty?
      assert project.errors[:repo_url].empty?
      assert project.errors[:live_url].empty?
    end
    bad_urls = %w[abc htpp www.]
    bad_urls.each do |bad_url|
      project = Project.new(screenshot_url: bad_url, repo_url: bad_url, live_url: bad_url)
      project.save
      assert_not project.errors[:screenshot_url].empty?
      assert_not project.errors[:repo_url].empty?
      assert_not project.errors[:live_url].empty?
    end
  end
end
