module ApplicationHelper

  def show_categories
    @categories = Category.all

    result = "<ul>"
    for category in @categories
      result << "<li>#{link_to category.name, jobs_path(:cat => category.name)}</li>"
    end
    result << "</ul>"

    return result.html_safe

  end
end
