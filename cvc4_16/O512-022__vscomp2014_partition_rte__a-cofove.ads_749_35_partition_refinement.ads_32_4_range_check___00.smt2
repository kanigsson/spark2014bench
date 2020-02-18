;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-sort us_rep 0)

(declare-fun bool_eq (us_rep us_rep) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep)))))
(define-fun sequence__ref_sequence__content__3__projection ((a sequence__ref)) us_rep 
  (sequence__content a))

(declare-sort index_count 0)

(declare-fun index_countqtint (index_count) Int)

;; index_count'axiom
  (assert
  (forall ((i index_count))
  (and (<= 0 (index_countqtint i)) (<= (index_countqtint i) 6))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (index_count index_count) Bool)

(declare-const dummy1 index_count)

(declare-datatypes ((index_count__ref 0))
(((index_count__refqtmk (index_count__content index_count)))))
(define-fun index_count__ref_index_count__content__projection ((a index_count__ref)) index_count 
  (index_count__content a))

(define-fun to_rep ((x index_count)) Int (index_countqtint x))

(declare-fun of_rep (Int) index_count)

;; inversion_axiom
  (assert
  (forall ((x index_count))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x index_count)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep1 ((x index)) Int (indexqtint x))

(declare-fun of_rep1 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__partition_refinement__interval__first index)(rec__partition_refinement__interval__last index)(rec__partition_refinement__interval__count index_count)))))
(define-fun us_split_fields_rec__partition_refinement__interval__first__projection ((a us_split_fields)) index 
  (rec__partition_refinement__interval__first a))

(define-fun us_split_fields_rec__partition_refinement__interval__last__projection ((a us_split_fields)) index 
  (rec__partition_refinement__interval__last a))

(define-fun us_split_fields_rec__partition_refinement__interval__count__projection ((a us_split_fields)) index_count 
  (rec__partition_refinement__interval__count a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__5__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__5__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep1
                            (rec__partition_refinement__interval__first
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__partition_refinement__interval__first
                                                   (us_split_fields1 b))))
                         (= (to_rep1
                            (rec__partition_refinement__interval__last
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__partition_refinement__interval__last
                                                   (us_split_fields1 b)))))
                         (= (to_rep
                            (rec__partition_refinement__interval__count
                            (us_split_fields1 a))) (to_rep
                                                   (rec__partition_refinement__interval__count
                                                   (us_split_fields1 b)))))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const partition_refinement__interval__first__first__bit Int)

(declare-const partition_refinement__interval__first__last__bit Int)

(declare-const partition_refinement__interval__first__position Int)

;; partition_refinement__interval__first__first__bit_axiom
  (assert (<= 0 partition_refinement__interval__first__first__bit))

;; partition_refinement__interval__first__last__bit_axiom
  (assert
  (< partition_refinement__interval__first__first__bit partition_refinement__interval__first__last__bit))

;; partition_refinement__interval__first__position_axiom
  (assert (<= 0 partition_refinement__interval__first__position))

(declare-const partition_refinement__interval__last__first__bit Int)

(declare-const partition_refinement__interval__last__last__bit Int)

(declare-const partition_refinement__interval__last__position Int)

;; partition_refinement__interval__last__first__bit_axiom
  (assert (<= 0 partition_refinement__interval__last__first__bit))

;; partition_refinement__interval__last__last__bit_axiom
  (assert
  (< partition_refinement__interval__last__first__bit partition_refinement__interval__last__last__bit))

;; partition_refinement__interval__last__position_axiom
  (assert (<= 0 partition_refinement__interval__last__position))

(declare-const partition_refinement__interval__count__first__bit Int)

(declare-const partition_refinement__interval__count__last__bit Int)

(declare-const partition_refinement__interval__count__position Int)

;; partition_refinement__interval__count__first__bit_axiom
  (assert (<= 0 partition_refinement__interval__count__first__bit))

;; partition_refinement__interval__count__last__bit_axiom
  (assert
  (< partition_refinement__interval__count__first__bit partition_refinement__interval__count__last__bit))

;; partition_refinement__interval__count__position_axiom
  (assert (<= 0 partition_refinement__interval__count__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((interval__ref 0))
(((interval__refqtmk (interval__content us_rep1)))))
(define-fun interval__ref_interval__content__projection ((a interval__ref)) us_rep1 
  (interval__content a))

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep1)))))
(define-fun element_type__ref_element_type__content__9__projection ((a element_type__ref)) us_rep1 
  (element_type__content a))

(declare-fun get (us_rep Int) us_rep1)

(declare-fun get__function_guard (us_rep1 us_rep Int) Bool)

(define-fun contains ((container us_rep) (fst Int) (lst Int)
  (item us_rep1)) Bool (ite (exists ((i Int))
                            (and (and (<= fst i) (<= i lst))
                            (= (bool_eq1 (get container i) item) true)))
                       true false))

(declare-fun contains__function_guard (Bool us_rep Int Int us_rep1) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(define-fun last ((container us_rep)) Int (+ (- 1) (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 10001))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 10001)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (capacity_range capacity_range) Bool)

(declare-const dummy4 capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep2 ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep2 (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range3
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__partition_refinement__partitions__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__partition_refinement__partitions__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__partition_refinement__partitions__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__3__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__partition_refinement__partitions__vector us_main_type1)))))
(define-fun us_split_fields_rec__partition_refinement__partitions__vector__projection ((a us_split_fields2)) us_main_type1 
  (rec__partition_refinement__partitions__vector a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__6__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1
  (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__6__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep2
                            (rec__partition_refinement__partitions__vector__capacity
                            (us_split_discrs1 a))) (to_rep2
                                                   (rec__partition_refinement__partitions__vector__capacity
                                                   (us_split_discrs1 b))))
                         (= (us_main_eq1
                            (rec__partition_refinement__partitions__vector
                            (us_split_fields3 a))
                            (rec__partition_refinement__partitions__vector
                            (us_split_fields3 b))) true))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const partition_refinement__partitions__vector__capacity__first__bit Int)

(declare-const partition_refinement__partitions__vector__capacity__last__bit Int)

(declare-const partition_refinement__partitions__vector__capacity__position Int)

;; partition_refinement__partitions__vector__capacity__first__bit_axiom
  (assert
  (<= 0 partition_refinement__partitions__vector__capacity__first__bit))

;; partition_refinement__partitions__vector__capacity__last__bit_axiom
  (assert
  (< partition_refinement__partitions__vector__capacity__first__bit partition_refinement__partitions__vector__capacity__last__bit))

;; partition_refinement__partitions__vector__capacity__position_axiom
  (assert
  (<= 0 partition_refinement__partitions__vector__capacity__position))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep2)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep2 
  (vector__content a))

(declare-fun model1 (us_rep2) us_rep)

(declare-fun model__function_guard (us_rep us_rep2) Bool)

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(declare-fun oeq (us_rep2 us_rep2) Bool)

(declare-fun oeq__function_guard (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq5 a b) (oeq a b)) :pattern ((user_eq5 a b)) )))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq1 ((left us_rep)
  (right us_rep)) Bool (and (= (length left) (length right)) (ite (forall
                                                                  ((n Int))
                                                                  (=>
                                                                  (and
                                                                  (<= 0 n)
                                                                  (<= n 
                                                                  (last left)))
                                                                  (= 
                                                                  (bool_eq1
                                                                  (get left
                                                                  n)
                                                                  (get right
                                                                  n)) true)))
                                                             true false)))

(declare-fun oeq__function_guard1 (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq1 a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_1188 us_rep)
  (temp___skip_top_level_1189 Bool)) Bool (=>
                                          (not
                                          (= temp___skip_top_level_1189 true))
                                          (= (length temp___expr_1188) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (= (length (model1 container)) (length1 container)) :pattern ((model1
                                                                   container)) )))

(define-fun last_index ((container us_rep2)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep2) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= (- 1) (extended_indexqtint i)) (<= (extended_indexqtint i) 10001))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 1) x) (<= x 10001)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy6 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__3__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant ((temp___expr_1139 Int)
  (temp___is_init_1135 Bool) (temp___skip_constant_1136 Bool)
  (temp___do_toplevel_1137 Bool)
  (temp___do_typ_inv_1138 Bool)) Bool (=>
                                      (or (= temp___is_init_1135 true)
                                      (<= (- 1) 10001)) (in_range4
                                      temp___expr_1139)))

(declare-const container us_rep2)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 us_rep1)))))
(define-fun element_type__ref_element_type__content__8__projection ((a element_type__ref1)) us_rep1 
  (element_type__content1 a))

(declare-const item us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const index1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 0 (index_typeqtint i)) (<= (index_typeqtint i) 10000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__3__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_1122 Int)
  (temp___is_init_1118 Bool) (temp___skip_constant_1119 Bool)
  (temp___do_toplevel_1120 Bool)
  (temp___do_typ_inv_1121 Bool)) Bool (=>
                                      (or (= temp___is_init_1118 true)
                                      (<= 0 10000)) (in_range5
                                      temp___expr_1122)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= (- 1) (extended_indexqtint1 i))
  (<= (extended_indexqtint1 i) 10000))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 1) x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (extended_index1 extended_index1) Bool)

(declare-const dummy8 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__4__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant2 ((temp___expr_416 Int)
  (temp___is_init_412 Bool) (temp___skip_constant_413 Bool)
  (temp___do_toplevel_414 Bool)
  (temp___do_typ_inv_415 Bool)) Bool (=>
                                     (or (= temp___is_init_412 true)
                                     (<= 0 6)) (in_range1 temp___expr_416)))

(define-fun dynamic_invariant3 ((temp___expr_423 Int)
  (temp___is_init_419 Bool) (temp___skip_constant_420 Bool)
  (temp___do_toplevel_421 Bool)
  (temp___do_typ_inv_422 Bool)) Bool (=>
                                     (or (= temp___is_init_419 true)
                                     (<= 0 5)) (in_range2 temp___expr_423)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (count_type count_type) Bool)

(declare-const dummy9 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_447 Int)
  (temp___is_init_443 Bool) (temp___skip_constant_444 Bool)
  (temp___do_toplevel_445 Bool)
  (temp___do_typ_inv_446 Bool)) Bool (=>
                                     (or (= temp___is_init_443 true)
                                     (<= 0 2147483647)) (in_range7
                                     temp___expr_447)))

(define-fun dynamic_invariant5 ((temp___expr_1146 Int)
  (temp___is_init_1142 Bool) (temp___skip_constant_1143 Bool)
  (temp___do_toplevel_1144 Bool)
  (temp___do_typ_inv_1145 Bool)) Bool (=>
                                      (or (= temp___is_init_1142 true)
                                      (<= 0 10001)) (in_range3
                                      temp___expr_1146)))

(define-fun capacity ((container1 us_rep2)) Int (to_rep2
                                                (rec__partition_refinement__partitions__vector__capacity
                                                (us_split_discrs1 container1))))

(declare-fun capacity__function_guard (Int us_rep2) Bool)

;; length__post_axiom
  (assert
  (forall ((container1 us_rep2))
  (! (let ((result (length1 container1)))
     (and (<= result (capacity container1)) (dynamic_invariant5 result true
     false true true))) :pattern ((length1 container1)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep2) (right us_rep2))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(define-fun dynamic_invariant6 ((temp___expr_1180 Int)
  (temp___is_init_1176 Bool) (temp___skip_constant_1177 Bool)
  (temp___do_toplevel_1178 Bool)
  (temp___do_typ_inv_1179 Bool)) Bool (=>
                                      (or (= temp___is_init_1176 true)
                                      (<= (- 1) 10000)) (in_range6
                                      temp___expr_1180)))

;; length__post_axiom
  (assert
  (forall ((container1 us_rep))
  (! (let ((result (length container1)))
     (and (<= (+ (- 1) result) 10000) (dynamic_invariant4 result true false
     true true))) :pattern ((length container1)) )))

;; get__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "a-cofove.ads", line 734, characters 0-0
  (not
  (=> (dynamic_invariant1 index1 true false true true)
  (let ((o container))
  (let ((o1 (last_index o)))
  (=>
  (and (dynamic_invariant o1 true false true true) (= o1 (last (model1 o))))
  (=> (not (<= index1 o1))
  (let ((o2 container))
  (let ((o3 (last_index o2)))
  (=>
  (and (dynamic_invariant o3 true false true true) (= o3 (last (model1 o2))))
  (in_range6 o3)))))))))))
(check-sat)