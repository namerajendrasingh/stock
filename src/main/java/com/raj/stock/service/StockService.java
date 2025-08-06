package com.raj.stock.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.raj.stock.entity.Stock;
import com.raj.stock.repository.StockRepository;

import jakarta.persistence.EntityNotFoundException;

@Service
public class StockService {
	private static final Logger logger = LoggerFactory.getLogger(StockService.class);
    private final StockRepository stockRepository;

    public StockService(StockRepository stockRepository) {
        this.stockRepository = stockRepository;
    }

    public List<Stock> getStocksByUserId(Long userId) {
        return stockRepository.findByUserId(userId);
    }

    public Stock saveStock(Stock stock) {
        return stockRepository.save(stock);
    }

    public void deleteStock(Long id) {
        stockRepository.deleteById(id);
    }

	public Page<Stock> getStocks(Pageable pageable) {
		return stockRepository.findAll(pageable);
	}
	
	public Stock getStockById(Long id) {
        return stockRepository.findById(id).orElseThrow(() -> {
                    logger.error("Stock with ID {} not found", id);
                    return new EntityNotFoundException("Stock with ID " + id + " not found");
                });
    }

}
