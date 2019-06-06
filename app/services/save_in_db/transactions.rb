class SaveInDb::Transactions

  def self.call(bridge_tranactions, user, access_token)
    bridge_tranactions.each do |transaction|
      category = Category.find_by(bridge_id: transaction["category"]["id"])
      # create or find account
      bridge_account_id = transaction["account"]["id"]
      account = Account.find_by(bridge_id: bridge_account_id)
      if account.nil?
        bridge_account = Bidge::Accounts::Fetch.call(bridge_account_id, bridge_temp_access_token)
        # account = Bridge::SaveInDb::Account.call(bridge_account)
      end
      #create or find bank
        #code exteral methods, and call if don't have account and/or bank
      operation = Operation.new(
        description: transaction["description"],
        amount: transaction["amount"],
        date: transaction["date"],
        bridge_id: transaction["id"],
        user: user,
        category: category,
        # account: account
        #ask TA
        # account_id: transaction["account"]["id"]
      )
      operation.save
    end
  end
end
