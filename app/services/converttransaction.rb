class Converttransaction

  # generic - job running

  def self.subscription_exists?(transactions, operator)
    result = false
    transactions.each do |transaction|
      result = true if transaction.operator == operator
    end
    return result
  end

  def self.call(transactions)
    operators = Operator.all
    transactions.each do |transaction|
      operators.each do |operator|
        if transaction.description && operator.regex && transaction.description.downcase.include?(operator.regex.downcase)
          if self.subscription_exists?(transactions, operator) # identifier les transactions qui font parti d'un abonnement
            subs = Subscription.find_by(operator: operator)
            transaction.update(subscription: subs)
          else
            new_subs = Subscription.new(operator: operator)
            transaction.update(subscription: new_subs)
          end
        end
      end
    end
  end

  # user specific - after user registration

  def self.call_user(transactions)
    user = current_user
    operators = Operator.all
    user.transactions.each do |transaction|
      operators.each do |operator|
        if transaction.description && operator.regex && transaction.description.downcase.include?(operator.regex.downcase)
          if self.subscription_exists?(transactions, operator) # identifier les transactions qui font parti d'un abonnement
            subs = Subscription.find_by(operator: operator)
            transaction.update(subscription: subs)
          else
            new_subs = Subscription.new(operator: operator)
            transaction.update(subscription: new_subs)
          end
        end
      end
    end
  end
end



# class ConvertTransactions
#   def user_transactions
#     current_user.operations # rrecuperer la liste des transactions d'un utilisateur
#   end

#   def check_if_subscription_exists?(user, transactions, operator)
#     default = false
#     user.transactions.select do |transaction|
#       !transaction.subscription.operator.nil?
#     end

#   def subscription_creation(operator)
#     Subscription.create(user: current_user, operator: operator)
#   end

#   def convert_transactions(transactions)
#     transactions = user.transactions
#     operators = Operator.all
#     transactions.each do |transaction|
#       operators.each do |operator|
#         if check_if_subscription_exists?(current_user, transactions, operator) # identifier les transactions qui font parti d'un abonnement
#           subs = Subscriptions.find
#           transaction.update(subscription: subs)
#         else
#           new_subs = Subscription.new(user: currenmnt_user, operator: operator)
#           transaction.update(subscription: new_subs)
#         end
#       end
#     end
#   end
# # creer l'abonnement si il n'existe pas operateur
# # associer cet abonnement a un
# end

