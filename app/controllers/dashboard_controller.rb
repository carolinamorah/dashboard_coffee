class DashboardController < ApplicationController
    def index
        @last12m_sales = Sale.group_by_month(:sale_date, last:12, format: "%b %Y").order(sale_date: :asc).sum(:price)
        @last12m_sales_count = Sale.group_by_month(:sale_date, last:12, format: "%b %Y").order(sale_date: :asc).count
        @last12m_sales_average = Sale.group_by_month(:sale_date, last:12, format: "%b %Y").order(sale_date: :asc).average(:price)
    
        #origin
        
        @piechart_last12m_sales = Sale.where('sale_date >=?', 1.year.ago).group(:origin).order(sale_date: :asc).count
        @piechart_last6m_sales = Sale.where('sale_date >=?', 6.months.ago).group(:origin).order(sale_date: :asc).count
        @piechart_last3m_sales = Sale.where('sale_date >=?', 3.months.ago).group(:origin).order(sale_date: :asc).count
        @piechart_last1m_sales = Sale.where('sale_date >=?', 1.months.ago).group(:origin).order(sale_date: :asc).count
        
        
        #blend_name
    
    
        @last12_sales_blend = Sale.where("sale_date >= ?", 1.year.ago).group(:blend_name).order(sale_date: :asc).count
        @last6_sales_blend = Sale.where("sale_date >= ?", 6.month.ago).group(:blend_name).order(sale_date: :asc).count
        @last3_sales_blend = Sale.where("sale_date >= ?", 3.month.ago).group(:blend_name).order(sale_date: :asc).count
        @last1_sales_blend = Sale.where("sale_date >= ?", 1.month.ago).group(:blend_name).order(sale_date: :asc).count
    end
end
