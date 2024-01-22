# app/helpers/custom_form_builder.rb

class CustomFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def file_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def number_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def phone_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def date_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def email_field(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  # Ajoutez d'autres méthodes de champs ici...
  def password_field(method, options = {})

    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def submit(value = nil, options = {})
    options.merge!(class: submit_class)

    @template.content_tag(:div, class: "mt-4") do
      super(value, options)
    end
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    label_content = label(method, class: [label_check_class, "ml-2"])
    field_content = super(method, merge_tailwind_classes(checkbox_class, options), checked_value, unchecked_value)

    @template.content_tag(:div, class: field_class) do
      @template.content_tag(:div, field_content + label_content, class: "flex items-center")
    end
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    label_content = label(method, class: label_class)
    field_content = super(method, choices, options, merge_tailwind_classes(select_class, html_options), &block)

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})

    label_content = label(method, class: label_class)
    field_content = super(method, collection, value_method, text_method, options, merge_tailwind_classes(select_class, html_options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def country_select(method, priority_countries = nil, options = {}, html_options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, ["FR","ES","DE"], {sort_provided: false}, merge_tailwind_classes(select_class, html_options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  def text_area(method, options = {})
    label_content = label(method, class: label_class)
    field_content = super(method, merge_tailwind_classes(input_class, options))

    @template.content_tag(:div, class: field_class) do
      label_content + @template.content_tag(:div, field_content, class: "mt-2")
    end
  end

  private

  def merge_tailwind_classes(default_class, options)
    class_name = options[:class]
    options.merge(class: class_name ? "#{default_class} #{class_name}" : default_class)
  end

  def label_class
    "absolute inline-block -top-1.5 rounded-xl px-2 left-4 bg-slate-800 text-sm font-medium text-slate-400"    
  end

  def label_check_class
    "bg-slate-800 text-sm font-medium text-slate-400"    
  end

  def input_class
    "mt-1 bg-slate-900 text-white focus:ring-slate-700 rounded-lg " +
    "inline-block px-4 py-3.5 focus:border-indigo-500 block w-full shadow-sm " +
    "text-lg border-slate-600 hover:border-indigo-700"
  end

  def checkbox_class
    "bg-slate-900 text-indigo-500 size-6 focus:ring-slate-700 rounded-full "
  end

  def field_class
    "mb-6 relative"
  end

  def select_class
    "mt-2 block bg-slate-900 text-white w-full rounded-lg border-0 " + 
    "pb-3.5 pt-6 pl-3 px-4 pr-10 ring-1 ring-inset ring-slate-700 focus:ring-2 " + 
    "focus:ring-indigo-500 text-lg sm:leading-6"
  end

  def submit_class
    "inline-flex w-full cursor-pointer justify-center py-2 px-4 " +
    "border border-transparent shadow-sm text-sm font-medium text-white " +
    "rounded-full bg-indigo-700 hover:bg-indigo-600 focus:outline-none " + 
    "focus:ring-2 focus:ring-offset-2 focus:ring-indigo-600"
  end
end
