module ComponentsHelper
  # https://tailwind-elements.com/docs/standard/components/buttons/
  def ch_button_link(path, **args)
    custom_classes = args.delete(:class)
    classes = 'flex justify-center items-center px-6 py-2 border-2 border-blue-600 text-blue-600 font-medium text-xs uppercase rounded hover:bg-black hover:bg-opacity-5 focus:outline-none focus:ring-0 transition duration-150 ease-in-out'
    link_to(path, class: [classes, custom_classes].join(' '), **args) do
      yield if block_given?
    end
  end
end
