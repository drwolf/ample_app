require 'spec_helper'

describe "Static pages" do

  
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }

      it { should have_selector('h1', :text => 'Ample App') }        
      it { should have_selector('title', text: full_title('')) }
      it { should_not have_selector('title', :text => '| Home') }
       
        describe "for signed_in users" do
          let(:user) { FactoryGirl.create(:user) }
              before do
                  FactoryGirl.create(:micropost, user: user, content: "Dawai dabei")
                  FactoryGirl.create(:micropost, user: user, content: "Plumbai plubm")        
                  sign_in(user)
                  visit root_path
              end
          
              it "should render the user's feed" do
                  user.feed.each do |item|
                    page.should have_selector("li##{item.id}", text: item.content)
                  end
              end
          
          
          describe "follower/following counts" do
          let(:other_user) { FactoryGirl.create(:user) } 
              before do
                other_user.follow!(user)
                visit root_path
              end
              
           it { should have_link("0 following", href: following_user_path(user)) }
           it { should have_link("1 followers", href: followers_user_path(user)) }
          end
        end
    
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title("Help")) }
  end

  describe "About link" do
	  before { visit root_path }
	  
   it {  find_link('About')[:href].should == 'https://railsrob.wordpress.com/eine-seite/' } 
  end

  describe "Contact link" do  
	  before { visit root_path }
	  
    it { find_link('Contact')[:href].should == 'https://contact-demo-mailer.herokuapp.com' }
       
  end
  
  describe "Blog link" do
    before { visit root_path }
    
   it { find_link('Blog')[:href].should == 'https://railsrob.wordpress.com/' }
  end
end

