package com.example.SpringData.Repository;

import com.example.SpringData.Entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.Instant;
import java.util.List;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {

    // findBy + Sku + Containing  ->  WHERE sku LIKE '%?%'
    // Spring writes the SQL from the method name. No body needed.
    List<ProductEntity> findBySkuContaining(String keyword);

    // findBy + CreatedAt + Before  ->  WHERE created_at < ?
    // The parameter type must match the FIELD type: createdAt is an Instant.
    List<ProductEntity> findByCreatedAtBefore(Instant cutoff);
}
