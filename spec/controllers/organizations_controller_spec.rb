require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe OrganizationsController do

  # This should return the minimal set of attributes required to create a valid
  # Organization. As you add validations to Organization, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all organizations as @organizations" do
      organization = Organization.create! valid_attributes
      get :index
      assigns(:organizations).should eq([organization])
    end
  end

  describe "GET show" do
    it "assigns the requested organization as @organization" do
      organization = Organization.create! valid_attributes
      get :show, :id => organization.id.to_s
      assigns(:organization).should eq(organization)
    end
  end

  describe "GET new" do
    it "assigns a new organization as @organization" do
      get :new
      assigns(:organization).should be_a_new(Organization)
    end
  end

  describe "GET edit" do
    it "assigns the requested organization as @organization" do
      organization = Organization.create! valid_attributes
      get :edit, :id => organization.id.to_s
      assigns(:organization).should eq(organization)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Organization" do
        expect {
          post :create, :organization => valid_attributes
        }.to change(Organization, :count).by(1)
      end

      it "assigns a newly created organization as @organization" do
        post :create, :organization => valid_attributes
        assigns(:organization).should be_a(Organization)
        assigns(:organization).should be_persisted
      end

      it "redirects to the created organization" do
        post :create, :organization => valid_attributes
        response.should redirect_to(Organization.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        post :create, :organization => {}
        assigns(:organization).should be_a_new(Organization)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        post :create, :organization => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested organization" do
        organization = Organization.create! valid_attributes
        # Assuming there are no other organizations in the database, this
        # specifies that the Organization created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Organization.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => organization.id, :organization => {'these' => 'params'}
      end

      it "assigns the requested organization as @organization" do
        organization = Organization.create! valid_attributes
        put :update, :id => organization.id, :organization => valid_attributes
        assigns(:organization).should eq(organization)
      end

      it "redirects to the organization" do
        organization = Organization.create! valid_attributes
        put :update, :id => organization.id, :organization => valid_attributes
        response.should redirect_to(organization)
      end
    end

    describe "with invalid params" do
      it "assigns the organization as @organization" do
        organization = Organization.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        put :update, :id => organization.id.to_s, :organization => {}
        assigns(:organization).should eq(organization)
      end

      it "re-renders the 'edit' template" do
        organization = Organization.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Organization.any_instance.stub(:save).and_return(false)
        put :update, :id => organization.id.to_s, :organization => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested organization" do
      organization = Organization.create! valid_attributes
      expect {
        delete :destroy, :id => organization.id.to_s
      }.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      organization = Organization.create! valid_attributes
      delete :destroy, :id => organization.id.to_s
      response.should redirect_to(organizations_url)
    end
  end

end
