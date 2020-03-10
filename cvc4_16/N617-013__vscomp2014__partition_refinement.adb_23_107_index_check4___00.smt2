(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i)) (<= (capacity_rangeqtint i) 10001))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10001)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__partition_refinement__partitions__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__partition_refinement__partitions__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__partition_refinement__partitions__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__partition_refinement__partitions__vector us_main_type)))))
(define-fun us_split_fields_rec__partition_refinement__partitions__vector__projection ((a us_split_fields)) us_main_type 
  (rec__partition_refinement__partitions__vector a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__partition_refinement__partitions__vector__capacity
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__partition_refinement__partitions__vector__capacity
                                                  (us_split_discrs1 b))))
                        (= (us_main_eq
                           (rec__partition_refinement__partitions__vector
                           (us_split_fields1 a))
                           (rec__partition_refinement__partitions__vector
                           (us_split_fields1 b))) true))
                   true false))

(define-fun in_range2 ((rec__partition_refinement__partitions__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__partition_refinement__partitions__vector__capacity1 
  (to_rep (rec__partition_refinement__partitions__vector__capacity a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

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

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep 
  (vector__content a))

(define-fun capacity ((container us_rep)) Int (to_rep
                                              (rec__partition_refinement__partitions__vector__capacity
                                              (us_split_discrs1 container))))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

(define-fun dynamic_invariant ((temp___expr_301 Int)
  (temp___is_init_297 Bool) (temp___skip_constant_298 Bool)
  (temp___do_toplevel_299 Bool)
  (temp___do_typ_inv_300 Bool)) Bool (=>
                                     (or (= temp___is_init_297 true)
                                     (<= 0 10001)) (in_range1
                                     temp___expr_301)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant result true
     false true true))) :pattern ((length container)) )))

(declare-sort index_count 0)

(declare-fun index_countqtint (index_count) Int)

;; index_count'axiom
  (assert
  (forall ((i index_count))
  (and (<= 0 (index_countqtint i)) (<= (index_countqtint i) 6))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index_count index_count) Bool)

(declare-const dummy2 index_count)

(declare-datatypes ((index_count__ref 0))
(((index_count__refqtmk (index_count__content index_count)))))
(define-fun index_count__ref_index_count__content__projection ((a index_count__ref)) index_count 
  (index_count__content a))

(define-fun to_rep1 ((x index_count)) Int (index_countqtint x))

(declare-fun of_rep1 (Int) index_count)

;; inversion_axiom
  (assert
  (forall ((x index_count))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index_count)) (! (in_range3
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 5))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun to_rep2 ((x index)) Int (indexqtint x))

(declare-fun of_rep2 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__partition_refinement__interval__first index)(rec__partition_refinement__interval__last index)(rec__partition_refinement__interval__count index_count)))))
(define-fun us_split_fields_rec__partition_refinement__interval__first__projection ((a us_split_fields2)) index 
  (rec__partition_refinement__interval__first a))

(define-fun us_split_fields_rec__partition_refinement__interval__last__projection ((a us_split_fields2)) index 
  (rec__partition_refinement__interval__last a))

(define-fun us_split_fields_rec__partition_refinement__interval__count__projection ((a us_split_fields2)) index_count 
  (rec__partition_refinement__interval__count a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep2
                            (rec__partition_refinement__interval__first
                            (us_split_fields3 a))) (to_rep2
                                                   (rec__partition_refinement__interval__first
                                                   (us_split_fields3 b))))
                         (= (to_rep2
                            (rec__partition_refinement__interval__last
                            (us_split_fields3 a))) (to_rep2
                                                   (rec__partition_refinement__interval__last
                                                   (us_split_fields3 b)))))
                         (= (to_rep1
                            (rec__partition_refinement__interval__count
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__partition_refinement__interval__count
                                                   (us_split_fields3 b)))))
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

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((interval__ref 0))
(((interval__refqtmk (interval__content us_rep1)))))
(define-fun interval__ref_interval__content__projection ((a interval__ref)) us_rep1 
  (interval__content a))

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep1)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) us_rep1 
  (element_type__content a))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep2 0)

(declare-fun bool_eq2 (us_rep2 us_rep2) Bool)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep2)))))
(define-fun sequence__ref_sequence__content__projection ((a sequence__ref)) us_rep2 
  (sequence__content a))

(declare-datatypes ((element_type__ref1 0))
(((element_type__refqtmk1 (element_type__content1 us_rep1)))))
(define-fun element_type__ref_element_type__content__2__projection ((a element_type__ref1)) us_rep1 
  (element_type__content1 a))

(declare-fun get (us_rep2 Int) us_rep1)

(declare-fun get__function_guard (us_rep1 us_rep2 Int) Bool)

(declare-fun model1 (us_rep) us_rep2)

(declare-fun model__function_guard (us_rep2 us_rep) Bool)

(declare-fun length1 (us_rep2) Int)

(declare-fun length__function_guard1 (Int us_rep2) Bool)

(define-fun last ((container us_rep2)) Int (+ (- 1) (length1 container)))

(declare-fun last__function_guard (Int us_rep2) Bool)

(define-fun last_index ((container us_rep)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep) Bool)

(declare-fun first_index__function_guard (Int us_rep) Bool)

(define-fun element ((container us_rep)
  (index1 Int)) us_rep1 (get (model1 container) index1))

(declare-fun element__function_guard (us_rep1 us_rep Int) Bool)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const partition_refinement__partitions__vector__capacity__first__bit1 Int)

(declare-const partition_refinement__partitions__vector__capacity__last__bit1 Int)

(declare-const partition_refinement__partitions__vector__capacity__position1 Int)

;; partition_refinement__partitions__vector__capacity__first__bit_axiom
  (assert
  (<= 0 partition_refinement__partitions__vector__capacity__first__bit1))

;; partition_refinement__partitions__vector__capacity__last__bit_axiom
  (assert
  (< partition_refinement__partitions__vector__capacity__first__bit1 
  partition_refinement__partitions__vector__capacity__last__bit1))

;; partition_refinement__partitions__vector__capacity__position_axiom
  (assert
  (<= 0 partition_refinement__partitions__vector__capacity__position1))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((partition__ref 0))
(((partition__refqtmk (partition__content us_rep)))))
(define-fun partition__ref_partition__content__projection ((a partition__ref)) us_rep 
  (partition__content a))

(declare-const p__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq6 a b) (oeq a b)) :pattern ((user_eq6 a b)) )))

(declare-sort partition_index 0)

(declare-fun partition_indexqtint (partition_index) Int)

;; partition_index'axiom
  (assert
  (forall ((i partition_index))
  (and (<= 0 (partition_indexqtint i)) (<= (partition_indexqtint i) 10000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq7 (partition_index partition_index) Bool)

(declare-const dummy7 partition_index)

(declare-datatypes ((partition_index__ref 0))
(((partition_index__refqtmk (partition_index__content partition_index)))))
(define-fun partition_index__ref_partition_index__content__projection ((a partition_index__ref)) partition_index 
  (partition_index__content a))

(define-fun to_rep3 ((x partition_index)) Int (partition_indexqtint x))

(declare-fun of_rep3 (Int) partition_index)

;; inversion_axiom
  (assert
  (forall ((x partition_index))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x partition_index)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int partition_index))))))
(declare-fun slide ((Array Int partition_index) Int
  Int) (Array Int partition_index))

;; slide_eq
  (assert
  (forall ((a (Array Int partition_index)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int partition_index)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq3 ((a (Array Int partition_index)) (a__first Int)
  (a__last Int) (b (Array Int partition_index)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_234 Int))
                           (=>
                           (and (<= a__first temp___idx_234)
                           (<= temp___idx_234 a__last))
                           (= (to_rep3 (select a temp___idx_234)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_234)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int partition_index)) (b (Array Int partition_index)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq3 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_234 Int))
  (=> (and (<= a__first temp___idx_234) (<= temp___idx_234 a__last))
  (= (to_rep3 (select a temp___idx_234)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_234)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r1b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r3b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const r4b Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-sort tindex_countB 0)

(declare-fun tindex_countBqtint (tindex_countB) Int)

;; tindex_countB'axiom
  (assert
  (forall ((i tindex_countB))
  (and (<= (- 128) (tindex_countBqtint i)) (<= (tindex_countBqtint i) 127))))

(define-fun in_range6 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq8 (tindex_countB tindex_countB) Bool)

(declare-const dummy8 tindex_countB)

(declare-datatypes ((tindex_countB__ref 0))
(((tindex_countB__refqtmk (tindex_countB__content tindex_countB)))))
(define-fun tindex_countB__ref_tindex_countB__content__projection ((a tindex_countB__ref)) tindex_countB 
  (tindex_countB__content a))

(define-fun dynamic_invariant1 ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (=>
                                     (or (= temp___is_init_242 true)
                                     (<= 0 5)) (in_range4 temp___expr_246)))

(declare-sort tpartition_indexB 0)

(declare-fun tpartition_indexBqtint (tpartition_indexB) Int)

;; tpartition_indexB'axiom
  (assert
  (forall ((i tpartition_indexB))
  (and (<= (- 32768) (tpartition_indexBqtint i))
  (<= (tpartition_indexBqtint i) 32767))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq9 (tpartition_indexB tpartition_indexB) Bool)

(declare-const dummy9 tpartition_indexB)

(declare-datatypes ((tpartition_indexB__ref 0))
(((tpartition_indexB__refqtmk (tpartition_indexB__content tpartition_indexB)))))
(define-fun tpartition_indexB__ref_tpartition_indexB__content__projection ((a tpartition_indexB__ref)) tpartition_indexB 
  (tpartition_indexB__content a))

(define-fun dynamic_invariant2 ((temp___expr_263 Int)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (=>
                                     (or (= temp___is_init_259 true)
                                     (<= 0 10000)) (in_range5
                                     temp___expr_263)))

(define-fun to_rep4 ((x tindex_countB)) Int (tindex_countBqtint x))

(declare-fun of_rep4 (Int) tindex_countB)

;; inversion_axiom
  (assert
  (forall ((x tindex_countB))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x tindex_countB)) (! (in_range6
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range6 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq10 (tindex_countB tindex_countB) Bool)

(declare-const dummy10 tindex_countB)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content tindex_countB)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) tindex_countB 
  (t5b__content a))

(define-fun dynamic_invariant3 ((temp___expr_239 Int)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (or (= temp___is_init_235 true)
                                     (<= 0 6)) (in_range3 temp___expr_239)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq11 (count_type count_type) Bool)

(declare-const dummy11 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant4 ((temp___expr_294 Int)
  (temp___is_init_290 Bool) (temp___skip_constant_291 Bool)
  (temp___do_toplevel_292 Bool)
  (temp___do_typ_inv_293 Bool)) Bool (=>
                                     (or (= temp___is_init_290 true)
                                     (<= 0 2147483647)) (in_range8
                                     temp___expr_294)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= (- 1) (extended_indexqtint i)) (<= (extended_indexqtint i) 10001))))

(define-fun in_range9 ((x Int)) Bool (and (<= (- 1) x) (<= x 10001)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq12 (extended_index extended_index) Bool)

(declare-const dummy12 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant5 ((temp___expr_287 Int)
  (temp___is_init_283 Bool) (temp___skip_constant_284 Bool)
  (temp___do_toplevel_285 Bool)
  (temp___do_typ_inv_286 Bool)) Bool (=>
                                     (or (= temp___is_init_283 true)
                                     (<= (- 1) 10001)) (in_range9
                                     temp___expr_287)))

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun oeq1 ((left us_rep2)
  (right us_rep2)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 0 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (bool_eq1
                                                                   (get left
                                                                   n)
                                                                   (get right
                                                                   n)) true)))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep2 us_rep2) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep2) (b us_rep2))
  (! (= (user_eq5 a b) (oeq1 a b)) :pattern ((user_eq5 a b)) )))

(define-fun default_initial_assumption ((temp___expr_343 us_rep2)
  (temp___skip_top_level_344 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_344 true))
                                         (= (length1 temp___expr_343) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 0 (index_typeqtint i)) (<= (index_typeqtint i) 10000))))

(define-fun in_range10 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE10 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check10 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE10 (us_image) Int)

(declare-fun user_eq13 (index_type index_type) Bool)

(declare-const dummy13 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant6 ((temp___expr_270 Int)
  (temp___is_init_266 Bool) (temp___skip_constant_267 Bool)
  (temp___do_toplevel_268 Bool)
  (temp___do_typ_inv_269 Bool)) Bool (=>
                                     (or (= temp___is_init_266 true)
                                     (<= 0 10000)) (in_range10
                                     temp___expr_270)))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= (- 1) (extended_indexqtint1 i))
  (<= (extended_indexqtint1 i) 10000))))

(define-fun in_range11 ((x Int)) Bool (and (<= (- 1) x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE11 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check11 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE11 (us_image) Int)

(declare-fun user_eq14 (extended_index1 extended_index1) Bool)

(declare-const dummy14 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__2__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant7 ((temp___expr_335 Int)
  (temp___is_init_331 Bool) (temp___skip_constant_332 Bool)
  (temp___do_toplevel_333 Bool)
  (temp___do_typ_inv_334 Bool)) Bool (=>
                                     (or (= temp___is_init_331 true)
                                     (<= (- 1) 10000)) (in_range11
                                     temp___expr_335)))

;; length__post_axiom
  (assert
  (forall ((container us_rep2))
  (! (let ((result (length1 container)))
     (and (<= (+ (- 1) result) 10000) (dynamic_invariant4 result true false
     true true))) :pattern ((length1 container)) )))

;; get__post_axiom
  (assert true)

(declare-const rliteral index_count)

;; rliteral_axiom
  (assert (= (index_countqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "partition_refinement.ads", line 28, characters 0-0
  (not
  (forall ((p__split_fields us_main_type) (p_prime_index Int))
  (=> (dynamic_invariant2 p_prime_index false false true true)
  (let ((o (us_repqtmk p__split_discrs (us_split_fieldsqtmk p__split_fields))))
  (let ((o1 (length o)))
  (=> (and (dynamic_invariant o1 true false true true) (<= o1 (capacity o)))
  (=> (= (- o1 1) r1b)
  (=> (in_range7 r1b)
  (forall ((j Int))
  (=> (= j 0)
  (=> (= (and (ite (<= 0 j) true false) (ite (<= j r1b) true false)) true)
  (forall ((f (Array Int partition_index)) (p_prime_index1 Int) (j1 Int))
  (=>
  (= (and (ite (dynamic_invariant2 p_prime_index1 false true true true) true
          false) (ite (and (<= 0 j1) (<= j1 r1b)) true false)) true)
  (let ((o2 (us_repqtmk p__split_discrs
            (us_split_fieldsqtmk p__split_fields))))
  (let ((temp___684 (element o2 j1)))
  (=> (= (bool_eq1 temp___684 (get (model1 o2) j1)) true)
  (forall ((p_elem__split_fields us_split_fields2))
  (=> (= p_elem__split_fields (us_split_fields3 temp___684))
  (forall ((temp___696 Int))
  (=>
  (= (to_rep1
     (rec__partition_refinement__interval__count p_elem__split_fields)) temp___696)
  (forall ((o3 Int))
  (=>
  (= (to_rep2
     (rec__partition_refinement__interval__first p_elem__split_fields)) o3)
  (forall ((o4 Int))
  (=>
  (= (to_rep2
     (rec__partition_refinement__interval__last p_elem__split_fields)) o4)
  (forall ((spark__branch Bool))
  (=>
  (= spark__branch (and (ite (<= 1 temp___696) true false) (ite (<= temp___696 (- o4 o3))
                                                           true false)))
  (=> (= spark__branch true)
  (forall ((o5 Int))
  (=>
  (= (to_rep1
     (rec__partition_refinement__interval__count p_elem__split_fields)) o5)
  (forall ((o6 Int))
  (=>
  (= (to_rep2
     (rec__partition_refinement__interval__first p_elem__split_fields)) o6)
  (let ((o7 (+ o6 o5)))
  (=> (in_range4 o7)
  (forall ((o8 index))
  (=> (= (to_rep2 o8) o7)
  (forall ((p_prime__split_fields us_split_fields2))
  (=>
  (= p_prime__split_fields (us_split_fieldsqtmk1 o8
                           (rec__partition_refinement__interval__last
                           p_elem__split_fields) rliteral))
  (let ((o9 (us_repqtmk p__split_discrs
            (us_split_fieldsqtmk p__split_fields))))
  (let ((o10 (length o9)))
  (=>
  (and (dynamic_invariant o10 true false true true) (<= o10 (capacity o9)))
  (=> (in_range5 o10)
  (forall ((p_prime_index2 Int))
  (=> (= p_prime_index2 o10)
  (forall ((partition_refinement__make_new_partitions__L_2__R3b__assume Int))
  (=>
  (= (to_rep2
     (rec__partition_refinement__interval__first p_prime__split_fields)) partition_refinement__make_new_partitions__L_2__R3b__assume)
  (=> (= partition_refinement__make_new_partitions__L_2__R3b__assume 
  r3b)
  (=> (dynamic_invariant1 r3b true false true true)
  (forall ((partition_refinement__make_new_partitions__L_2__R4b__assume Int))
  (=>
  (= (to_rep2
     (rec__partition_refinement__interval__last p_prime__split_fields)) partition_refinement__make_new_partitions__L_2__R4b__assume)
  (=> (= partition_refinement__make_new_partitions__L_2__R4b__assume 
  r4b)
  (=> (dynamic_invariant1 r4b true false true true)
  (let ((temp___686 r3b))
  (forall ((i Int))
  (=> (= i temp___686)
  (=>
  (= (and (ite (<= temp___686 i) true false) (ite (<= i r4b) true false)) true)
  (forall ((temp___loop_entry_692 (Array Int partition_index)))
  (=> (= temp___loop_entry_692 f)
  (forall ((temp___loop_entry_694 (Array Int partition_index)))
  (=> (= temp___loop_entry_694 f)
  (forall ((o11 partition_index))
  (=> (= (to_rep3 o11) p_prime_index2)
  (forall ((f1 (Array Int partition_index)))
  (=> (= f1 (store f i o11))
  (=>
  (exists ((o12 Int))
  (= (to_rep2
     (rec__partition_refinement__interval__first p_prime__split_fields)) o12))
  (=>
  (exists ((o12 Int))
  (= (to_rep2
     (rec__partition_refinement__interval__first p_prime__split_fields)) o12))
  (forall ((usf Int))
  (let ((o12 (+ i 1)))
  (=> (in_range6 o12)
  (=>
  (= (and (ite (<= o12 usf) true false) (ite (<= usf 5) true false)) true)
  (<= 0 usf)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
