class TabsController < ApplicationController
  def index
    @tabs = Tab.page(params[:page]).per(10)

    render("tab_templates/index.html.erb")
  end

  def show
    @resource = Resource.new
    @text_component = TextComponent.new
    @tab = Tab.find(params.fetch("id_to_display"))

    render("tab_templates/show.html.erb")
  end

  def new_form
    @tab = Tab.new

    render("tab_templates/new_form.html.erb")
  end

  def create_row
    @tab = Tab.new

    @tab.title = params.fetch("title")
    @tab.num_of_tabs = params.fetch("num_of_tabs")
    @tab.topic_id = params.fetch("topic_id")

    if @tab.valid?
      @tab.save

      redirect_back(:fallback_location => "/tabs", :notice => "Tab created successfully.")
    else
      render("tab_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_topic
    @tab = Tab.new

    @tab.title = params.fetch("title")
    @tab.num_of_tabs = params.fetch("num_of_tabs")
    @tab.topic_id = params.fetch("topic_id")

    if @tab.valid?
      @tab.save

      redirect_to("/topics/#{@tab.topic_id}", notice: "Tab created successfully.")
    else
      render("tab_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @tab = Tab.find(params.fetch("prefill_with_id"))

    render("tab_templates/edit_form.html.erb")
  end

  def update_row
    @tab = Tab.find(params.fetch("id_to_modify"))

    @tab.title = params.fetch("title")
    @tab.num_of_tabs = params.fetch("num_of_tabs")
    @tab.topic_id = params.fetch("topic_id")

    if @tab.valid?
      @tab.save

      redirect_to("/tabs/#{@tab.id}", :notice => "Tab updated successfully.")
    else
      render("tab_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_topic
    @tab = Tab.find(params.fetch("id_to_remove"))

    @tab.destroy

    redirect_to("/topics/#{@tab.topic_id}", notice: "Tab deleted successfully.")
  end

  def destroy_row
    @tab = Tab.find(params.fetch("id_to_remove"))

    @tab.destroy

    redirect_to("/tabs", :notice => "Tab deleted successfully.")
  end
end
