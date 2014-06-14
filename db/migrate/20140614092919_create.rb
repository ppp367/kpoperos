class Create < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string     :type      # Only needed if using single table inheritence
    end

    create_table :group_memberships do |t|
      t.string     :member_type   # Needed to make polymorphic members work
      t.integer    :member_id   # The member that belongs to this group
      t.integer    :group_id    # The group to which the member belongs
      t.string     :group_name    # Links a member to a named group (if using named groups)
    end

    add_index :group_memberships, [:member_id, :member_type]
    add_index :group_memberships, :group_id
    add_index :group_memberships, :group_name
  end
end