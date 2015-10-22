echo "Enter root's password each time"
echo "Creating user..."
cat user.sql | mysql -u root -p
echo "Creating database..."
echo "create database EmployeeSystems" | mysql -u root -p
echo "Setting up database..."
cat database.sql | mysql -u root -p
echo "Seeding database..."
cat Populate.sql | mysql -u root -p