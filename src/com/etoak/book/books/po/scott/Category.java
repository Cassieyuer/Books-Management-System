package com.etoak.book.books.po.scott;

public class Category {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCOTT.CATEGORY.ID
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column SCOTT.CATEGORY.NAME
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCOTT.CATEGORY.ID
     *
     * @return the value of SCOTT.CATEGORY.ID
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCOTT.CATEGORY.ID
     *
     * @param ID the value for SCOTT.CATEGORY.ID
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    public void setId(String id) {
        this.id = id== null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column SCOTT.CATEGORY.NAME
     *
     * @return the value of SCOTT.CATEGORY.NAME
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column SCOTT.CATEGORY.NAME
     *
     * @param NAME the value for SCOTT.CATEGORY.NAME
     *
     * @mbggenerated Thu Nov 02 09:53:18 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}