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

  def resource_name(model, item_id)
    model.constantize.exists?(item_id) ? model.constantize.find(item_id).name : '----'
  end
end
