require 'spec_helper'

describe Gossiper::EmailConfig do
  before do
    Gossiper.configure do |config|
      config.default_from = 'from@email.com'
      config.default_cc   = ['cc@email.com']
      config.default_bcc  = ['bcc@email.com']
    end
  end
  let(:config)        { Gossiper.configuration }
  subject             { described_class.new(notification) }

  let(:user)          { double(:user, email: 'user@email.com', name: 'User Name') }
  let(:notification)  { double(:notification, user: user, kind: 'user_welcome') }
  its(:user)          { should be(user) }
  its(:notification)  { should be(notification) }
  its(:from)          { should eq(config.default_from) }
  its(:cc)            { should eq(config.default_cc) }
  its(:bcc)           { should eq(config.default_bcc) }
  its(:subject)       { should eq(I18n.t('gossiper.notifications.user_welcome.subject')) }
  its(:attachments)   { should eq({}) }
  its(:template_name) { should eq('user_welcome_notification') }
  its(:template_path) { should eq('notifications') }
  its(:instance_variables){ should eq({}) }

  describe "#to" do
    context "when user has a name" do
      its(:to) { should eq(['User Name <user@email.com>']) }
    end

    context "when user does not have a name" do
      let(:user) { double(:user, email: 'nameless@email.com') }
      its(:to)   { should eq(['nameless@email.com']) }
    end
  end

end
