class SaveInDb::Transactions

  def self.call(bridge_tranactions, user)
    bridge_tranactions.each do |transaction|
      category = Category.find_by(bridge_id: transaction["category"]["id"])
      # create or find account
      #create or find bank
        #code exteral methods, and call if don't have account and/or bank
      operation = Operation.new(
        description: transaction["description"],
        amount: transaction["amount"],
        date: transaction["date"],
        bridge_id: transaction["id"],
        user: user,
        category: category
      )
      operation.save
    end
  end
end
