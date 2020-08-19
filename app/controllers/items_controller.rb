class ItemsController < ApplicationController
end

def index
end

def new
  @item = Item.new
end

def create
  @item = Item.new
  @item = Item.save
end