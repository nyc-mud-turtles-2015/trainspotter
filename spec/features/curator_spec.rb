require 'rails_helper'

# example code:
# describe 'Log in Process' do
#     let(:log_in) {
#         user = create(:user)
#         visit login_path
#         within("#login") do
#             fill_in 'Username', :with => user.username
#             fill_in 'Password', :with => user.password
#             click_button 'login'
#         end
#     }
#     describe "If user is not logged in" do
#         it 'should have a register link' do
#           visit root_path
#           expect(page).to have_content('register')
#           expect(page).to have_content('login')
#       end
#   end

#   describe "when user is logged in" do
#     pending 'should replace register link with logout' do
#         log_in
#         expect(page).to have_content('Ask Question')
#         expect(page).to have_content('Tags')
#         expect(page).to have_content('logout')
#     end

#     pending "should log me out" do
#       log_in
#       click_link 'logout'
#       expect(page).to have_content('register')
#       expect(page).to have_content('login')
#     end
#   end
# end
