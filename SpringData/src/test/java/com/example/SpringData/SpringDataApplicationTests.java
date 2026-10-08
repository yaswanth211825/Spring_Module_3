package com.example.SpringData;

import com.example.SpringData.Entity.ProductEntity;
import com.example.SpringData.Repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.Instant;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertFalse;

@SpringBootTest
class SpringDataApplicationTests {
	@Autowired
	ProductRepository productRepository;

	@Test
	void contextLoads() {
	}
	@Test
	void getRepositoryTest() {
		List<ProductEntity> products = productRepository.findAll();
		for(ProductEntity product : products) {
			System.out.println(product);
		}
	}
	@Test
	void getProductBySkuTest() {
		List<ProductEntity> products = productRepository.findBySkuContaining("SHIRT");
		for(ProductEntity product : products) {
			System.out.println(product);
		}

	}
	@Test
	void getProductByDateAddedTest() {
		// Instant.parse reads ISO-8601 text. The Z on the end means UTC.
		Instant cutoff = Instant.parse("2026-11-12T12:24:00Z");

		List<ProductEntity> products = productRepository.findByCreatedAtBefore(cutoff);

		for (ProductEntity product : products) {
			System.out.println(product);
		}
		assertFalse(products.isEmpty(), "expected seeded products created before " + cutoff);
	}

}
