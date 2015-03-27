# Overwrite ratyrate help method
Helpers.module_eval do
	def rating_for(rateable_obj, dimension=nil, options={})

		cached_average = rateable_obj.average dimension
	  avg = cached_average ? cached_average.avg : 0

	  star         = options[:star]         || 5
	  enable_half  = options[:enable_half]  || false
	  half_show    = options[:half_show]    || true
	  star_path    = options[:star_path]    || '/assets'
	  star_on      = options[:star_on]      || image_path('/star-on.png')
	  star_off     = options[:star_off]     || image_path('/star-off.png')
	  star_half    = options[:star_half]    || image_path('/star-half.png')
	  cancel       = options[:cancel]       || false
	  cancel_place = options[:cancel_place] || 'left'
	  cancel_hint  = options[:cancel_hint]  || 'Cancel current rating!'
	  cancel_on    = options[:cancel_on]    || image_path('/cancel-on.png')
	  cancel_off   = options[:cancel_off]   || image_path('/cancel-off.png')
	  noRatedMsg   = options[:noRatedMsg]   || 'I\'am readOnly and I haven\'t rated yet!'
	  # round        = options[:round]        || { down: .26, full: .6, up: .76 }
	  space        = options[:space]        || false
	  single       = options[:single]       || false
	  target       = options[:target]       || ''
	  targetText   = options[:targetText]   || ''
	  targetType   = options[:targetType]   || 'hint'
	  targetFormat = options[:targetFormat] || '{score}'
	  targetScore  = options[:targetScore]  || ''
	  readOnly  = options[:readonly]  || false
		disable			 = options[:disable] || false

	  disable_after_rate = options[:disable_after_rate] && true
	  disable_after_rate = true if disable_after_rate == nil

	  if disable_after_rate
	    readonly = !(current_user && rateable_obj.can_rate?(current_user, dimension))
	  else
	    readonly = !current_user || false
	  end

		if disable
			readonly = true
			readOnly = true
		end

	  if options[:imdb_avg] && readonly
	    content_tag :div, '', :style => "background-image:url('#{image_path('/mid-star.png')}');width:61px;height:57px;margin-top:10px;" do
	        content_tag :p, avg, :style => "position:relative;font-size:.8rem;text-align:center;line-height:60px;"
	    end
	  else
	    content_tag :div, '', "data-dimension" => dimension, :class => "star", "data-rating" => avg,
	                "data-id" => rateable_obj.id, "data-classname" => rateable_obj.class.name,
	                "data-disable-after-rate" => disable_after_rate,
	                "data-readonly" => readOnly,
	                "data-enable-half" => enable_half,
	                "data-half-show" => half_show,
	                "data-star-count" => star,
	                "data-star-path" => star_path,
	                "data-star-on" => star_on,
	                "data-star-off" => star_off,
	                "data-star-half" => star_half,
	                "data-cancel" => cancel,
	                "data-cancel-place" => cancel_place,
	                "data-cancel-hint"  => cancel_hint,
	                "data-cancel-on" => cancel_on,
	                "data-cancel-off" => cancel_off,
	                "data-no-rated-message" => noRatedMsg,
	                # "data-round" => round,
	                "data-space" => space,
	                "data-single" => single,
	                "data-target" => target,
	                "data-target-text" => targetText,
	                "data-target-type" => targetType,
	                "data-target-format" => targetFormat,
	                "data-target-score" => targetScore
	  end
	end
end
