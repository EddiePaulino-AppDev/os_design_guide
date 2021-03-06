class ResourcesController < ApplicationController
  def index
    @q = Resource.ransack(params[:q])
    @resources = @q.result(:distinct => true).includes(:tab).page(params[:page]).per(10)

    render("resource_templates/index.html.erb")
  end

  def show
    @resource = Resource.find(params.fetch("id_to_display"))

    render("resource_templates/show.html.erb")
  end

  def new_form
    @resource = Resource.new

    render("resource_templates/new_form.html.erb")
  end

  def create_row
    @resource = Resource.new

    @resource.category = params.fetch("category")
    @resource.tab_id = params.fetch("tab_id")
    @resource.resource = params.fetch("resource")

    if @resource.valid?
      @resource.save

      redirect_back(:fallback_location => "/resources", :notice => "Resource created successfully.")
    else
      render("resource_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_tab
    @resource = Resource.new

    @resource.category = params.fetch("category")
    @resource.tab_id = params.fetch("tab_id")
    @resource.resource = params.fetch("resource")

    if @resource.valid?
      @resource.save

      redirect_to("/tabs/#{@resource.tab_id}", notice: "Resource created successfully.")
    else
      render("resource_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @resource = Resource.find(params.fetch("prefill_with_id"))

    render("resource_templates/edit_form.html.erb")
  end

  def update_row
    @resource = Resource.find(params.fetch("id_to_modify"))

    @resource.category = params.fetch("category")
    @resource.tab_id = params.fetch("tab_id")
    @resource.resource = params.fetch("resource")

    if @resource.valid?
      @resource.save

      redirect_to("/resources/#{@resource.id}", :notice => "Resource updated successfully.")
    else
      render("resource_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_tab
    @resource = Resource.find(params.fetch("id_to_remove"))

    @resource.destroy

    redirect_to("/tabs/#{@resource.tab_id}", notice: "Resource deleted successfully.")
  end

  def destroy_row
    @resource = Resource.find(params.fetch("id_to_remove"))

    @resource.destroy

    redirect_to("/resources", :notice => "Resource deleted successfully.")
  end
end
