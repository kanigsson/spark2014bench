(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
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

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (rec__test_list__list__is_null_pointer Bool)(rec__test_list__list__pointer_address Int)(rec__test_list__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__test_list__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__test_list__list__is_null_pointer a))

(define-fun us_rep_rec__test_list__list__pointer_address__projection ((a us_rep)) Int 
  (rec__test_list__list__pointer_address a))

(define-fun us_rep_rec__test_list__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__test_list__list__pointer_value_abstr a))

(declare-datatypes ()
((us_rep__ref (us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__test_list__list__is_null_pointer a) 
                        (rec__test_list__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__test_list__list__is_null_pointer a) true))
                        (and
                        (= (rec__test_list__list__pointer_address a) 
                        (rec__test_list__list__pointer_address b))
                        (= (rec__test_list__list__pointer_value_abstr a) 
                        (rec__test_list__list__pointer_value_abstr b)))))
                   true false))

(declare-const dummy us_rep)

(declare-datatypes () ((t1b__ref (t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-const l us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy1 us_rep)

(declare-datatypes () ((t2b__ref (t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-fun tail_2 (us_rep) us_rep)

(declare-fun tail_2__function_guard (us_rep us_rep) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ()
((us_pledge_ty__ref
 (us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-fun test_list__tail_2__pledge (us_rep) us_pledge_ty)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const dummy3 us_rep)

(declare-datatypes () ((list__ref (list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__test_list__list_cell__data integer)(rec__test_list__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__test_list__list_cell__data__projection ((a us_split_fields)) integer 
  (rec__test_list__list_cell__data a))

(define-fun us_split_fields_rec__test_list__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__test_list__list_cell__next a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__test_list__list_cell__data
                            (us_split_fields1 a))) (to_rep
                                                   (rec__test_list__list_cell__data
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__test_list__list_cell__next
                            (us_split_fields1 a))
                            (rec__test_list__list_cell__next
                            (us_split_fields1 b))) true))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_list__list_cell__data__first__bit Int)

(declare-const test_list__list_cell__data__last__bit Int)

(declare-const test_list__list_cell__data__position Int)

;; test_list__list_cell__data__first__bit_axiom
  (assert (<= 0 test_list__list_cell__data__first__bit))

;; test_list__list_cell__data__last__bit_axiom
  (assert
  (< test_list__list_cell__data__first__bit test_list__list_cell__data__last__bit))

;; test_list__list_cell__data__position_axiom
  (assert (<= 0 test_list__list_cell__data__position))

(declare-const test_list__list_cell__next__first__bit Int)

(declare-const test_list__list_cell__next__last__bit Int)

(declare-const test_list__list_cell__next__position Int)

;; test_list__list_cell__next__first__bit_axiom
  (assert (<= 0 test_list__list_cell__next__first__bit))

;; test_list__list_cell__next__last__bit_axiom
  (assert
  (< test_list__list_cell__next__first__bit test_list__list_cell__next__last__bit))

;; test_list__list_cell__next__position_axiom
  (assert (<= 0 test_list__list_cell__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ()
((list_cell__ref (list_cell__refqtmk (list_cell__content us_rep1)))))
(define-fun list_cell__ref_list_cell__content__projection ((a list_cell__ref)) us_rep1 
  (list_cell__content a))

(declare-fun us_open (us_main_type) us_rep1)

(declare-fun us_close (us_rep1) us_main_type)

;; close_open
  (assert
  (forall ((x us_main_type))
  (! (= (us_close (us_open x)) x) :pattern ((us_open x)) )))

;; open_close
  (assert
  (forall ((x us_rep1))
  (! (= (us_open (us_close x)) x) :pattern ((us_close x)) )))

(define-fun rec__test_list__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__test_list__list__pointer_value_abstr a)))

(define-fun rec__test_list__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__test_list__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert (= (rec__test_list__list__is_null_pointer us_null_pointer) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (= (rec__test_list__list__is_null_pointer
                                            temp___expr_181) true))

(define-fun default_initial_assumption1 ((temp___expr_188 us_rep1)
  (temp___skip_top_level_189 Bool)) Bool (= (rec__test_list__list__is_null_pointer
                                            (rec__test_list__list_cell__next
                                            (us_split_fields1
                                            temp___expr_188))) true))

;; tail_2__post_axiom
  (assert
  (forall ((l1 us_rep))
  (! (=>
     (and (not (= (bool_eq l1 us_null_pointer) true))
     (not
     (= (bool_eq
        (rec__test_list__list_cell__next
        (us_split_fields1 (rec__test_list__list__pointer_value l1)))
        us_null_pointer) true)))
     (let ((result (tail_2 l1)))
     (=> (tail_2__function_guard result l1)
     (= (us_pledge_get (test_list__tail_2__pledge l1) l1 result) true)))) :pattern (
  (tail_2 l1)) )))

;; tail_2__def_axiom
  (assert
  (forall ((l1 us_rep))
  (! (= (tail_2 l1) (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value
                    (rec__test_list__list_cell__next
                    (us_split_fields1
                    (rec__test_list__list__pointer_value l1))))))) :pattern (
  (tail_2 l1)) )))

;; tail_2__pledge_axiom
  (assert
  (forall ((l1 us_rep))
  (forall ((temp___borrowed_196 us_rep))
  (forall ((temp___brower_192 us_rep))
  (! (=
     (= (us_pledge_get (test_list__tail_2__pledge l1) temp___borrowed_196
        temp___brower_192) true)
     (= (us_repqtmk (rec__test_list__list__is_null_pointer l1)
        (rec__test_list__list__pointer_address l1)
        (us_close
        (let ((temp___195 (rec__test_list__list__pointer_value l1)))
        (us_repqtmk1
        (let ((q_ (us_split_fields1 temp___195)))
        (us_split_fieldsqtmk (rec__test_list__list_cell__data q_)
        (let ((temp___194 (rec__test_list__list_cell__next
                          (us_split_fields1
                          (rec__test_list__list__pointer_value l1)))))
        (us_repqtmk (rec__test_list__list__is_null_pointer temp___194)
        (rec__test_list__list__pointer_address temp___194)
        (us_close
        (let ((temp___193 (rec__test_list__list__pointer_value
                          (rec__test_list__list_cell__next
                          (us_split_fields1
                          (rec__test_list__list__pointer_value l1))))))
        (us_repqtmk1
        (let ((q_1 (us_split_fields1 temp___193)))
        (us_split_fieldsqtmk (rec__test_list__list_cell__data q_1)
        temp___brower_192))))))))))))) temp___borrowed_196)) :pattern (
  (us_pledge_get (test_list__tail_2__pledge l1) temp___borrowed_196
  temp___brower_192)) )))))

;; Assume
  (assert
  (and (not (= (bool_eq l us_null_pointer) true))
  (not
  (= (bool_eq
     (rec__test_list__list_cell__next
     (us_split_fields1 (rec__test_list__list__pointer_value l)))
     us_null_pointer) true))))

(define-fun o () us_rep l)

(assert
;; defqtvc
 ;; File "test_list.adb", line 10, characters 0-0
  (not (rec__test_list__list__pointer_value__pred
  (rec__test_list__list_cell__next
  (us_split_fields1 (rec__test_list__list__pointer_value o))))))
(check-sat)
