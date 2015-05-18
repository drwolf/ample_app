require 'spec_helper'

describe "Static pages" do

  
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', :text => 'Ample App') }        
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', :text => '| Home') }
    
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

