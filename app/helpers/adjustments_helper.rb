module AdjustmentsHelper
  def new_adjustment_url
    @bucket ? adjustments_path(@user, @bucket) : user_adjustments_path(@user)
  end
  
  def subtitle
    if @user && @bucket
      "#{@user.permalink}: #{@bucket.permalink}"
    elsif @user
      @user.permalink
    else
      ""
    end
  end
  
  def adjustment_to_hash(adjustment, format = nil)
    adjustment_hash = {
      'id' => adjustment.id,
      'value' => adjustment.value,
      'path' => (adjustment.id ? adjustment_path(adjustment.user, adjustment.bucket, adjustment, :format => format) : nil),
      'user_permalink' => adjustment.user.permalink,
      'bucket_permalink' => adjustment.bucket.permalink,
      'created_at' => adjustment.created_at,
      'updated_at' => adjustment.updated_at
    }
    format == :json ? { :adjustment => adjustment_hash } : adjustment_hash
  end
  
  def adjustments_to_hash(adjustments, format = nil)
    adjustments.collect{|b| adjustment_to_hash(b, format) }
  end
  
  def adjustments_to_xml(adjustments)
    adjustments_to_hash(adjustments, :xml).to_xml(:root => 'adjustments')
  end
  
  def adjustments_to_json(adjustments)
    adjustments_to_hash(adjustments, :json).to_json(:root => 'adjustments')
  end
  
  def adjustment_to_xml(adjustment)
    adjustment_to_hash(adjustment, :xml).to_xml(:root => 'adjustment')
  end
  
  def adjustment_to_json(adjustment)
    adjustment_to_hash(adjustment, :json).to_json(:root => 'adjustment')
  end
  
end
