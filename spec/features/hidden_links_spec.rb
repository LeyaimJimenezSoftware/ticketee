require "rails_helper"

RSpec.feature "Users can only see the appropriate links" do 
  let(:project) { FactoryBot.create(:project) }
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }

	context "anonymous users" do

   	  scenario "cannot see the New Project link" do
	    visit "/"
	    expect(page).not_to have_link "New Project"
	  end
	end
	

	context "non-admin users (project viewers)" do
		before do
			login_as(user)
			assign_role!(user, :viewer, project)
		end

		scenario "cannot see the New Project link" do
			visit "/"
			expect(page).not_to have_link "New Project"
		end
			
		scenario "cannot see the delete Project link" do
			visit project_path(project)
			expect(page).not_to have_link "Delete Project"
		end

		scenario "cannot see the Edit Project link" do
			visit project_path(project)
			expect(page).not_to have_link "Edit Project"
		end

		scenario "can see the new Ticket link" do
			visit project_path(project)
			expect(page).not_to have_link "New Ticket"
		end
	end
		 
	context "admin users"  do
		before { login_as(admin) }

		scenario "can see the new Project link" do
			visit "/"
			expect(page).to have_link "New Project"
		end

		scenario "can see the delete Projectlink" do
			visit project_path(project)
			expect(page).to have_link "Delete Project"
		end

		scenario "can see the Edit Project link" do
			visit project_path(project)
			expect(page).to have_link "Edit Project"
		end

		scenario "can see the New Ticket link" do
		  visit project_path(project)
		  expect(page).to have_link "New Ticket"
	    end
	end
end

