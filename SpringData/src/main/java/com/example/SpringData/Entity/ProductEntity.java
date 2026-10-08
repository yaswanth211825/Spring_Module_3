package com.example.SpringData.Entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Objects;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(
        name = "product_JPA",

        // Business rules the DATABASE enforces. Never rely on Java checks alone:
        // two servers can insert the same SKU at the same instant.
        uniqueConstraints = {
                @UniqueConstraint(name = "uk_product_sku", columnNames = "sku")
        },

        // Indexes = columns you FILTER or SORT by often.
        // Don't index everything: every index slows down INSERT/UPDATE.
        indexes = {
                @Index(name = "idx_product_name", columnList = "name"),
                @Index(name = "idx_product_style", columnList = "style"),
                @Index(name = "idx_product_active_created", columnList = "active, created_at")
        }
)
public class ProductEntity {

    // IDENTITY = MySQL AUTO_INCREMENT. Use this instead of AUTO on MySQL,
    // otherwise Hibernate creates an extra sequence table.
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // The real-world identity of a product. Humans type this, not the id.
    @Column(name = "sku", nullable = false, length = 50, updatable = false)
    private String sku;

    @Column(name = "name", nullable = false, length = 200)
    private String name;

    @Column(name = "description", columnDefinition = "TEXT")
    private String description;

    // NEVER use double/float for money - 0.1 + 0.2 != 0.3 in binary floating point.
    // precision = total digits, scale = digits after the decimal point.
    @Column(name = "price", nullable = false, precision = 12, scale = 2)
    private BigDecimal price;

    @Column(name = "currency", nullable = false, length = 3)
    private String currency = "INR";

    // The long editorial "about this product" section.
    @Column(name = "overview", columnDefinition = "TEXT")
    private String overview;

    @Column(name = "style", length = 100)
    private String style;

    @Column(name = "features", columnDefinition = "TEXT")
    private String features;

    @Column(name = "specs", columnDefinition = "TEXT")
    private String specs;

    // Soft delete: you almost never DELETE a product in production
    // (orders still reference it). You hide it.
    @Column(name = "active", nullable = false)
    private boolean active = true;

    // Audit columns. Hibernate fills these in for you.
    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private Instant createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    // Optimistic locking: if two users edit the same row at once,
    // the second one gets an exception instead of silently overwriting.
    @Version
    @Column(name = "version", nullable = false)
    private Long version;

    public ProductEntity(String sku, String name, BigDecimal price) {
        this.sku = sku;
        this.name = name;
        this.price = price;
    }

    // Compare by SKU, not by id: a new object has id == null until it's saved,
    // which breaks HashSet/HashMap. Don't use Lombok's @Data/@EqualsAndHashCode here.
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductEntity other)) return false;
        return sku != null && sku.equals(other.sku);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sku);
    }

    @Override
    public String toString() {
        return "ProductEntity{id=" + id + ", sku='" + sku + "', name='" + name + "', price=" + price + "}";
    }
}
