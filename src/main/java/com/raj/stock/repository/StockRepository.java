package com.raj.stock.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.raj.stock.entity.Stock;

public interface StockRepository extends JpaRepository<Stock, Long> {
    List<Stock> findByUserId(Long userId);
}
