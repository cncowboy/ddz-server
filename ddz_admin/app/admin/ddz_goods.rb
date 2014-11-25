ActiveAdmin.register DdzGoods do

  permit_params do
    permitted = []
    permitted << :goodsName
    permitted << :goodsDesc
    permitted << :goodsType
    permitted << :goodsProps
    permitted << :sortIndex
    permitted
  end

  index do
    selectable_column
    id_column
    column :goodsName
    column :goodsDesc
    column :goodsType
    column :goodsProps
    column :sortIndex
    column :createAt
    column :updateAt
    actions
  end

  filter :goodsName
  filter :goodsDesc
  filter :goodsType

  form do |f|
    f.inputs "DdzGoods Details" do
      f.input :goodsName
      f.input :goodsDesc
      f.input :goodsType
      #f.input :goodsProps
      f.input :sortIndex

    end

    f.inputs "Goods Properties" do

      #f.input :goodsProps, as: "text"
      # f.inputs :name => "goodsProps", :for => f.object.goodsProps do |gf|
      #   gf.object.each_key { |k|
      #     f.input k
      #   }
      # end
      f.render partial: 'goodsProps', locals: {dataObj: f.object.goodsProps, objName: "goodsProps"}
      # f.object.goodsProps.each_key { |k|
      #   #"<input type='text' name='#{k}' value='#{f.object.goodsProps[k]}' />"
      # }
    end

    f.actions
  end

  controller do
    def update
      Rails.logger.info("on update..........#{@ddzGoods}")
      redirect_to({:action => :show}, {:notice => "Post Packages refresh event successfully!"})
    end
  end
end