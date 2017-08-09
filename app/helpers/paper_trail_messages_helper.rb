module PaperTrailMessagesHelper
  def formated_date(date)
    l(date, format: '%-d-%m-%Y %H:%M:%S')
  end

  def event_class_label(event)
    case event
    when 'create'
      'label-success'
    when 'update'
      'label-warning'
    when 'destroy'
      'label-danger'
    end
  end

  def resource_name(ptm) # ptm - PaperTrailMessage
    if ptm.item_type.constantize.exists?(ptm.item_id)
      ptm.item_type.constantize.find(ptm.item_id).name
    else
      PaperTrail::Version.where(item_id: ptm.item_id).last.reify.name
    end
  end
end
