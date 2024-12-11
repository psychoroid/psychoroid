-- Create function to update subscription type based on transactions
CREATE OR REPLACE FUNCTION update_subscription_type()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.transaction_type = 'subscription' THEN
        UPDATE user_roids
        SET subscription_type = 
            CASE 
                WHEN NEW.description LIKE '%pro%' THEN 'pro'
                WHEN NEW.description LIKE '%intense%' THEN 'intense'
                ELSE 'free'
            END
        WHERE user_id = NEW.user_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger for subscription updates
CREATE TRIGGER update_subscription_type_trigger
    AFTER INSERT ON roids_transactions
    FOR EACH ROW
    EXECUTE FUNCTION update_subscription_type(); 