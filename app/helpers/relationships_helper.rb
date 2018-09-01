module RelationshipsHelper

  def relationship(followed)
    relationship = Relationship.find(followed)
    User.find(relationship.followed_id)
  end
end
