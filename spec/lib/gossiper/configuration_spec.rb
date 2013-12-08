require 'spec_helper'

class DummyClass
end

describe Gossiper::Configuration, "#default_notification_user_class" do
  it "can be changed" do
    subject.default_notification_user_class = DummyClass
    expect(subject.default_notification_user_class).to eq('DummyClass')
  end
end

describe Gossiper::Configuration, "#default_notification_config_class" do
  it "can be changed" do
    subject.default_notification_config_class = DummyClass
    expect(subject.default_notification_config_class).to eq('DummyClass')
  end
end

describe Gossiper::Configuration, "#notifications_root_folder" do
  it "can be changed" do
    subject.notifications_root_folder = 'root_folder'
    expect(subject.notifications_root_folder).to eq('root_folder')
  end
end

describe Gossiper::Configuration, "#test_folder" do
  it "can be changed" do
    subject.notifications_test_folder = 'test_folder'
    expect(subject.notifications_test_folder).to eq('test_folder')
  end
end

describe Gossiper::Configuration, "#authorize_with" do
  it "actions on the block" do
    controller = double(:controller)
    controller.should_receive(:test)

    subject.authorize_with do |controller|
      controller.test
    end

    subject.authorize_with.call(controller)
  end
end
