class AddCurrentCompanyToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :current_company, :boolean
  end
end
