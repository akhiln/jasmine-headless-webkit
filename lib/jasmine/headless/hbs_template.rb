begin
  require 'handlebars_assets'

  module Jasmine::Headless
    class HBSTemplate < HandlebarsAssets::TiltHandlebars
      include Jasmine::Headless::FileChecker
      def evaluate(*args)
        if bad_format?(file)
          alert_bad_format(file)
          return ''
        end
        %{<script type="text/javascript">#{super}</script>}
      end
    end
  end
  
rescue LoadError
end