package com.go.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @author xujian
 *
 * 2012-5-16
 */
public class PageInfo<T> {
    private int perPage = 10;

    private int currentPage = 1;

    private int count = 0;

    private int maxPage = 1;

    private List<T> items = new ArrayList<T>();

    public PageInfo(int currentPage, int perPage) {
        this.currentPage = currentPage;
        this.perPage = perPage;
    }

    public int getPerPage() {
        return this.perPage;
    }

    public void setPerPage(int perPage) {
        this.perPage = perPage;
    }

    public int getCurrentPage() {
        return this.currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
        if (this.count % this.perPage == 0){
            this.maxPage = this.count / this.perPage;
        } else{
            this.maxPage = this.count / this.perPage + 1;
        }
        if( this.maxPage < 1 )
            this.maxPage = 1;
        if( this.currentPage > this.maxPage || this.currentPage < 1)
            this.currentPage = this.maxPage;
    }


    public int getMaxPage() {
        return this.maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public List<T> getItems() {
        return this.items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public int getStartIndex() {
        return (currentPage - 1) * perPage;
    }
}
