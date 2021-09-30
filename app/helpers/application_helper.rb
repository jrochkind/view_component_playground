module ApplicationHelper

  def render_with_layout_component(wrapper_component:nil)
    if wrapper_component
      render wrapper_component do
        yield
      end
    else
      yield
    end
  end

  def weird_thing(should_wrap_in_layout=true)
    render ExampleComponent.new.yield_self do |c|
      should_wrap_in_layout ? LayoutComponent.new() { render c } : c
    end
  end
end
