class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :position, :rank, :firstname, :lastname, :team, :total,
    :ppg, :full_name, :on_team, :available

  def full_name
    [object.firstname, object.lastname].join(" ")
  end

  def ppg
    object.ppg.round(1)
  end
end
