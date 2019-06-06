class SaveInDb::BankId
  def self.call(account_id)
    # bank.bridge_id = Bridge::Banks::Fetch.call(account_id)
    # bank.name = Bridge::Banks::Fetch.call(account_id)["name"]
  end
end
