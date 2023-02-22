class CreateDefaultSuperadmin < ActiveRecord::Migration[7.0]
  def up
    # create default superadmin
    default_superadmin = User.new
    default_superadmin.user_type = 'superadmin'
    default_superadmin.name = 'Super Admin'
    default_superadmin.email = 'superadmin@app.com'
    default_superadmin.password = 'password'
    default_superadmin.save()
  end

  def down
    default_superadmin = User.find_by_email!('superadmin@app.com')
    default_superadmin.delete()
  end
end
