-- Seeds the `product` table. Table name comes from @Table(name = "product").
-- Runs on EVERY startup, after Hibernate creates/updates the tables.
--
-- INSERT IGNORE = skip the row if that sku already exists, instead of crashing.
-- Without it the 2nd startup dies on the uk_product_sku constraint.
--
-- created_at / updated_at / version are filled by hand on purpose:
-- @CreationTimestamp and @Version are Java-side Hibernate features, and
-- data.sql goes straight to JDBC without passing through Hibernate.

INSERT IGNORE INTO product_jpa
    (sku, name, description, price, currency, overview, style, features, specs,
     active, created_at, updated_at, version)
VALUES
    ('TSHIRT-BLK-M', 'Black Cotton T-Shirt', 'Soft 100% cotton crew neck tee.', 799.00, 'INR',
     'A wardrobe staple in combed cotton that softens with every wash.', 'Casual',
     'Pre-shrunk; Reinforced shoulder seams; Tagless collar',
     'Material: 100% cotton | Fit: Regular | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('TSHIRT-WHT-L', 'White Cotton T-Shirt', 'Classic white crew neck in breathable cotton.', 799.00, 'INR',
     'The one tee that works under everything.', 'Casual',
     'Pre-shrunk; Double-stitched hem; Tagless collar',
     'Material: 100% cotton | Fit: Regular | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('POLO-NVY-M', 'Navy Pique Polo', 'Short-sleeve polo in textured pique knit.', 1299.00, 'INR',
     'Smarter than a tee, easier than a shirt.', 'Casual',
     'Ribbed collar and cuffs; Three-button placket; Side vents',
     'Material: 100% cotton pique | Fit: Regular | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('SHIRT-WHT-40', 'White Oxford Shirt', 'Button-down oxford in mid-weight cotton.', 1899.00, 'INR',
     'A shirt that handles both the office and dinner after.', 'Formal',
     'Button-down collar; Single chest pocket; Curved hem',
     'Material: 100% cotton oxford | Fit: Slim | Wash: Machine warm', true, NOW(), NOW(), 0),

    ('SHIRT-BLU-42', 'Blue Striped Shirt', 'Fine-stripe cotton shirt with spread collar.', 2099.00, 'INR',
     'Subtle stripes that read as solid from across a room.', 'Formal',
     'Spread collar; Mother-of-pearl buttons; Adjustable cuffs',
     'Material: 100% cotton poplin | Fit: Slim | Wash: Machine warm', true, NOW(), NOW(), 0),

    ('JEANS-BLU-32', 'Slim Fit Blue Jeans', 'Stretch denim with a tapered leg.', 2499.00, 'INR',
     'Everyday denim with just enough stretch to move in.', 'Casual',
     '2% elastane stretch; Five-pocket styling; Fade-resistant dye',
     'Material: 98% cotton, 2% elastane | Rise: Mid | Fit: Slim', true, NOW(), NOW(), 0),

    ('JEANS-BLK-34', 'Black Straight Jeans', 'Rigid black denim with a straight leg.', 2699.00, 'INR',
     'Straight-leg denim that holds its shape.', 'Casual',
     'Heavyweight 13oz denim; Button fly; Reinforced belt loops',
     'Material: 100% cotton | Rise: Mid | Fit: Straight', true, NOW(), NOW(), 0),

    ('CHINO-KHK-32', 'Khaki Chinos', 'Flat-front cotton twill trousers.', 1999.00, 'INR',
     'The trouser that fills the gap between jeans and formals.', 'Formal',
     'Wrinkle-resistant finish; Flat front; Hidden coin pocket',
     'Material: 97% cotton, 3% elastane | Rise: Mid | Fit: Slim', true, NOW(), NOW(), 0),

    ('TROUSER-GRY-34', 'Grey Formal Trousers', 'Tailored trousers in wool blend.', 3299.00, 'INR',
     'Crease-holding trousers for days that need one.', 'Formal',
     'Lined to the knee; Hook-and-bar closure; Pressed crease',
     'Material: 70% wool, 30% polyester | Rise: Mid | Fit: Tailored', true, NOW(), NOW(), 0),

    ('SHORTS-NVY-M', 'Navy Cotton Shorts', 'Mid-length shorts in washed cotton.', 1199.00, 'INR',
     'Shorts that survive a whole summer.', 'Casual',
     'Elastic side waist; Two side pockets; 7-inch inseam',
     'Material: 100% cotton | Inseam: 7 in | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('HOODIE-GRY-L', 'Grey Fleece Hoodie', 'Brushed-back fleece pullover hoodie.', 2299.00, 'INR',
     'Heavyweight fleece that gets softer over time.', 'Casual',
     'Brushed inner fleece; Kangaroo pocket; Ribbed cuffs',
     'Material: 80% cotton, 20% polyester | Weight: 320gsm | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('SWEATER-BRN-M', 'Brown Crew Sweater', 'Fine-gauge knit crew neck sweater.', 2799.00, 'INR',
     'A layering knit that is not too warm indoors.', 'Winter',
     'Fine 12-gauge knit; Ribbed trims; Shoulder-to-shoulder tape',
     'Material: 60% cotton, 40% acrylic | Fit: Regular | Wash: Hand wash', true, NOW(), NOW(), 0),

    ('JACKET-BLK-L', 'Black Bomber Jacket', 'Lightweight bomber with ribbed trims.', 4599.00, 'INR',
     'Light enough for evenings, structured enough to look sharp.', 'Winter',
     'Water-repellent shell; Full-zip front; Two welt pockets',
     'Material: Nylon shell, polyester lining | Fit: Regular | Wash: Wipe clean', true, NOW(), NOW(), 0),

    ('COAT-CAM-M', 'Camel Wool Overcoat', 'Single-breasted overcoat in wool blend.', 8999.00, 'INR',
     'The coat you buy once and wear for years.', 'Winter',
     'Notch lapel; Fully lined; Interior pocket',
     'Material: 70% wool, 30% polyester | Length: Knee | Wash: Dry clean', true, NOW(), NOW(), 0),

    ('KURTA-WHT-40', 'White Cotton Kurta', 'Straight-cut kurta in handloom cotton.', 1699.00, 'INR',
     'Breathable handloom cotton for warm-weather occasions.', 'Ethnic',
     'Mandarin collar; Side slits; Wooden buttons',
     'Material: 100% handloom cotton | Length: 42 in | Wash: Hand wash', true, NOW(), NOW(), 0),

    ('SHERWANI-GLD-42', 'Gold Embroidered Sherwani', 'Occasion sherwani with zari embroidery.', 15999.00, 'INR',
     'A full-dress piece for weddings and festivals.', 'Ethnic',
     'Hand-done zari work; Concealed placket; Includes inner kurta',
     'Material: Silk blend | Length: 44 in | Wash: Dry clean only', true, NOW(), NOW(), 0),

    ('TRACK-BLK-M', 'Black Track Pants', 'Tapered joggers in stretch jersey.', 1499.00, 'INR',
     'Gym pants that pass as regular pants.', 'Sportswear',
     'Moisture-wicking; Zip side pockets; Elasticated ankle',
     'Material: 88% polyester, 12% elastane | Fit: Tapered | Wash: Machine cold', true, NOW(), NOW(), 0),

    ('SHOE-WHT-9', 'White Leather Sneakers', 'Minimal low-top sneakers in full-grain leather.', 4299.00, 'INR',
     'Clean low-tops that go with everything.', 'Casual',
     'Full-grain leather upper; Cushioned insole; Rubber outsole',
     'Material: Leather | Sole: Rubber | Closure: Lace-up', true, NOW(), NOW(), 0),

    ('SHOE-BRN-10', 'Brown Leather Derby', 'Classic derby shoe with leather sole.', 6499.00, 'INR',
     'Formal shoes that break in rather than wear out.', 'Formal',
     'Goodyear welted; Leather lining; Stacked heel',
     'Material: Full-grain leather | Sole: Leather | Closure: Lace-up', true, NOW(), NOW(), 0),

    ('BELT-BLK-34', 'Black Leather Belt', 'Reversible leather belt with steel buckle.', 1299.00, 'INR',
     'One belt that covers both black and brown days.', 'Formal',
     'Reversible black/brown; Brushed steel buckle; 35mm width',
     'Material: Genuine leather | Width: 35 mm | Buckle: Steel', true, NOW(), NOW(), 0);
