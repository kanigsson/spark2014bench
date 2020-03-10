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

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (count_type count_type) Bool)

(declare-const dummy1 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant ((temp___expr_447 Int)
  (temp___is_init_443 Bool) (temp___skip_constant_444 Bool)
  (temp___do_toplevel_445 Bool)
  (temp___do_typ_inv_446 Bool)) Bool (=>
                                     (or (= temp___is_init_443 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_447)))

(define-fun length1 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container us_rep)) Int (+ (- 1) (length container)))

(declare-fun last__function_guard (Int us_rep) Bool)

(declare-sort index_count 0)

(declare-fun index_countqtint (index_count) Int)

;; index_count'axiom
  (assert
  (forall ((i index_count))
  (and (<= 0 (index_countqtint i)) (<= (index_countqtint i) 6))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (index_count index_count) Bool)

(declare-const dummy2 index_count)

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
  (forall ((x index_count)) (! (in_range2
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 5))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

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
  (forall ((x index)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
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

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

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

(define-fun oeq ((left us_rep)
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

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq a b) (oeq a b)) :pattern ((user_eq a b)) )))

(define-fun default_initial_assumption ((temp___expr_1199 us_rep)
  (temp___skip_top_level_1200 Bool)) Bool (=>
                                          (not
                                          (= temp___skip_top_level_1200 true))
                                          (= (length temp___expr_1199) 0)))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= (+ (- 1) result) 10000) (dynamic_invariant result true false
     true true))) :pattern ((length container)) )))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= (- 1) (extended_indexqtint i)) (<= (extended_indexqtint i) 10000))))

(define-fun in_range4 ((x Int)) Bool (and (<= (- 1) x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__4__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_1191 Int)
  (temp___is_init_1187 Bool) (temp___skip_constant_1188 Bool)
  (temp___do_toplevel_1189 Bool)
  (temp___do_typ_inv_1190 Bool)) Bool (=>
                                      (or (= temp___is_init_1187 true)
                                      (<= (- 1) 10000)) (in_range4
                                      temp___expr_1191)))

(declare-const left us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const right us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const offset Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy6 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 0 (index_typeqtint i)) (<= (index_typeqtint i) 10000))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (index_type index_type) Bool)

(declare-const dummy7 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__4__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_1174 Int)
  (temp___is_init_1170 Bool) (temp___skip_constant_1171 Bool)
  (temp___do_toplevel_1172 Bool)
  (temp___do_typ_inv_1173 Bool)) Bool (=>
                                      (or (= temp___is_init_1170 true)
                                      (<= 0 10000)) (in_range6
                                      temp___expr_1174)))

(define-fun dynamic_invariant3 ((temp___expr_416 Int)
  (temp___is_init_412 Bool) (temp___skip_constant_413 Bool)
  (temp___do_toplevel_414 Bool)
  (temp___do_typ_inv_415 Bool)) Bool (=>
                                     (or (= temp___is_init_412 true)
                                     (<= 0 6)) (in_range2 temp___expr_416)))

(define-fun dynamic_invariant4 ((temp___expr_423 Int)
  (temp___is_init_419 Bool) (temp___skip_constant_420 Bool)
  (temp___do_toplevel_421 Bool)
  (temp___do_typ_inv_422 Bool)) Bool (=>
                                     (or (= temp___is_init_419 true)
                                     (<= 0 5)) (in_range3 temp___expr_423)))

;; get__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "a-cofuve.ads", line 217, characters 0-0
  (not
  (forall ((o Bool))
  (=> (dynamic_invariant2 fst true false true true)
  (=> (dynamic_invariant1 lst true false true true)
  (=> (in_range5 offset)
  (=>
  (let ((o1 left))
  (let ((o2 (last o1)))
  (and
  (and (dynamic_invariant1 o2 true false true true)
  (= o2 (+ (- 1) (length o1))))
  (ite (<= lst o2)
  (and (or (not (< offset 0)) (in_range5 (- (- 32768) offset)))
  (= o (ite (< offset 0) (ite (<= (- (- 32768) offset) 0) true false)
       (distinct 1 0))))
  (= o false))))) (=> (= o true) (=> (<= fst lst) (in_range5 lst))))))))))
(check-sat)
(exit)
