module RelationshipsHelper

  def relationship(followed)
    relationship = Relationship.find_by(followed_id: followed)
    User.find(relationship.followed_id)
  end
end
