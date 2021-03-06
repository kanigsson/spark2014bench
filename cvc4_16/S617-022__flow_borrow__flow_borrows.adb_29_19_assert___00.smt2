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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__flow_borrows__int_ptr__is_null_pointer Bool)(rec__flow_borrows__int_ptr__pointer_address Int)(rec__flow_borrows__int_ptr__pointer_value integer)))))
(define-fun us_rep_rec__flow_borrows__int_ptr__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__flow_borrows__int_ptr__is_null_pointer a))

(define-fun us_rep_rec__flow_borrows__int_ptr__pointer_address__projection ((a us_rep)) Int 
  (rec__flow_borrows__int_ptr__pointer_address a))

(define-fun us_rep_rec__flow_borrows__int_ptr__pointer_value__projection ((a us_rep)) integer 
  (rec__flow_borrows__int_ptr__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__flow_borrows__int_ptr__is_null_pointer a) 
                        (rec__flow_borrows__int_ptr__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__flow_borrows__int_ptr__is_null_pointer a) true))
                        (and
                        (= (rec__flow_borrows__int_ptr__pointer_address a) 
                        (rec__flow_borrows__int_ptr__pointer_address b))
                        (= (rec__flow_borrows__int_ptr__pointer_value a) 
                        (rec__flow_borrows__int_ptr__pointer_value b)))))
                   true false))

(define-fun rec__flow_borrows__int_ptr__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__flow_borrows__int_ptr__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__flow_borrows__int_ptr__is_null_pointer us_null_pointer) true))

(declare-const dummy1 us_rep)

(declare-datatypes ((int_ptr__ref 0))
(((int_ptr__refqtmk (int_ptr__content us_rep)))))
(define-fun int_ptr__ref_int_ptr__content__projection ((a int_ptr__ref)) us_rep 
  (int_ptr__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__flow_borrows__two_ptrs__f us_rep)(rec__flow_borrows__two_ptrs__g us_rep)))))
(define-fun us_split_fields_rec__flow_borrows__two_ptrs__f__projection ((a us_split_fields)) us_rep 
  (rec__flow_borrows__two_ptrs__f a))

(define-fun us_split_fields_rec__flow_borrows__two_ptrs__g__projection ((a us_split_fields)) us_rep 
  (rec__flow_borrows__two_ptrs__g a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__flow_borrows__two_ptrs__f
                            (us_split_fields1 a))
                            (rec__flow_borrows__two_ptrs__f
                            (us_split_fields1 b))) true)
                         (= (bool_eq
                            (rec__flow_borrows__two_ptrs__g
                            (us_split_fields1 a))
                            (rec__flow_borrows__two_ptrs__g
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

(declare-const flow_borrows__two_ptrs__f__first__bit Int)

(declare-const flow_borrows__two_ptrs__f__last__bit Int)

(declare-const flow_borrows__two_ptrs__f__position Int)

;; flow_borrows__two_ptrs__f__first__bit_axiom
  (assert (<= 0 flow_borrows__two_ptrs__f__first__bit))

;; flow_borrows__two_ptrs__f__last__bit_axiom
  (assert
  (< flow_borrows__two_ptrs__f__first__bit flow_borrows__two_ptrs__f__last__bit))

;; flow_borrows__two_ptrs__f__position_axiom
  (assert (<= 0 flow_borrows__two_ptrs__f__position))

(declare-const flow_borrows__two_ptrs__g__first__bit Int)

(declare-const flow_borrows__two_ptrs__g__last__bit Int)

(declare-const flow_borrows__two_ptrs__g__position Int)

;; flow_borrows__two_ptrs__g__first__bit_axiom
  (assert (<= 0 flow_borrows__two_ptrs__g__first__bit))

;; flow_borrows__two_ptrs__g__last__bit_axiom
  (assert
  (< flow_borrows__two_ptrs__g__first__bit flow_borrows__two_ptrs__g__last__bit))

;; flow_borrows__two_ptrs__g__position_axiom
  (assert (<= 0 flow_borrows__two_ptrs__g__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((two_ptrs__ref 0))
(((two_ptrs__refqtmk (two_ptrs__content us_rep1)))))
(define-fun two_ptrs__ref_two_ptrs__content__projection ((a two_ptrs__ref)) us_rep1 
  (two_ptrs__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun default_initial_assumption ((temp___expr_187 us_rep1)
  (temp___skip_top_level_188 Bool)) Bool (and
                                         (= (rec__flow_borrows__int_ptr__is_null_pointer
                                            (rec__flow_borrows__two_ptrs__f
                                            (us_split_fields1
                                            temp___expr_187))) true)
                                         (= (rec__flow_borrows__int_ptr__is_null_pointer
                                            (rec__flow_borrows__two_ptrs__g
                                            (us_split_fields1
                                            temp___expr_187))) true)))

(declare-const dummy3 us_rep)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content us_rep)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_rep (t7b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep1 us_rep) Bool)

(define-fun default_initial_assumption1 ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (= (rec__flow_borrows__int_ptr__is_null_pointer
                                            temp___expr_180) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "flow_borrows.adb", line 1, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (flow_borrows__xf__assume us_rep)
  (xf__pointer_value integer) (xf__pointer_address Int)
  (xf__is_null_pointer Bool) (us_next_pointer_address1 Int)
  (flow_borrows__xg__assume us_rep) (xg__pointer_value integer)
  (xg__pointer_address Int) (xg__is_null_pointer Bool)
  (x__split_fields us_split_fields))
  (=>
  (= (and (ite (and
               (not
               (= (rec__flow_borrows__int_ptr__is_null_pointer
                  flow_borrows__xf__assume) true))
               (= (rec__flow_borrows__int_ptr__pointer_address
                  flow_borrows__xf__assume) us_next_pointer_address))
          true false) (ite (= (rec__flow_borrows__int_ptr__pointer_value
                              flow_borrows__xf__assume) (of_rep 5))
                      true false)) true)
  (=>
  (= xf__pointer_value (rec__flow_borrows__int_ptr__pointer_value
                       flow_borrows__xf__assume))
  (=>
  (= xf__pointer_address (rec__flow_borrows__int_ptr__pointer_address
                         flow_borrows__xf__assume))
  (=>
  (= xf__is_null_pointer (rec__flow_borrows__int_ptr__is_null_pointer
                         flow_borrows__xf__assume))
  (=>
  (= (and (ite (and
               (not
               (= (rec__flow_borrows__int_ptr__is_null_pointer
                  flow_borrows__xg__assume) true))
               (= (rec__flow_borrows__int_ptr__pointer_address
                  flow_borrows__xg__assume) us_next_pointer_address1))
          true false) (ite (= (rec__flow_borrows__int_ptr__pointer_value
                              flow_borrows__xg__assume) (of_rep 5))
                      true false)) true)
  (=>
  (= xg__pointer_value (rec__flow_borrows__int_ptr__pointer_value
                       flow_borrows__xg__assume))
  (=>
  (= xg__pointer_address (rec__flow_borrows__int_ptr__pointer_address
                         flow_borrows__xg__assume))
  (=>
  (= xg__is_null_pointer (rec__flow_borrows__int_ptr__is_null_pointer
                         flow_borrows__xg__assume))
  (=>
  (= x__split_fields (us_split_fieldsqtmk
                     (us_repqtmk xf__is_null_pointer xf__pointer_address
                     xf__pointer_value)
                     (us_repqtmk xg__is_null_pointer xg__pointer_address
                     xg__pointer_value)))
  (let ((flow_borrows__B_1__y__assume (rec__flow_borrows__two_ptrs__f
                                      x__split_fields)))
  (forall ((usf us_pledge_ty))
  (=>
  (forall ((temp___borrowed_198 us_rep1))
  (forall ((temp___brower_196 us_rep))
  (! (= (= (us_pledge_get usf temp___borrowed_198 temp___brower_196) true)
     (= (rec__flow_borrows__two_ptrs__f
        (us_split_fields1 temp___borrowed_198)) temp___brower_196)) :pattern (
  (us_pledge_get usf temp___borrowed_198 temp___brower_196)) )))
  (forall ((flow_borrows__B_1__y__pledge us_pledge_ty))
  (=> (= flow_borrows__B_1__y__pledge usf)
  (forall ((y__pointer_value integer))
  (=>
  (= y__pointer_value (rec__flow_borrows__int_ptr__pointer_value
                      flow_borrows__B_1__y__assume))
  (forall ((y__pointer_address Int))
  (=>
  (= y__pointer_address (rec__flow_borrows__int_ptr__pointer_address
                        flow_borrows__B_1__y__assume))
  (forall ((y__is_null_pointer Bool))
  (=>
  (= y__is_null_pointer (rec__flow_borrows__int_ptr__is_null_pointer
                        flow_borrows__B_1__y__assume))
  (=> (= (to_rep y__pointer_value) 5)
  (forall ((usf1 us_split_fields))
  (=>
  (and
  (= (us_pledge_get flow_borrows__B_1__y__pledge (us_repqtmk1 usf1)
     (us_repqtmk y__is_null_pointer y__pointer_address y__pointer_value)) true)
  (= (rec__flow_borrows__int_ptr__is_null_pointer
     (rec__flow_borrows__two_ptrs__f x__split_fields)) (rec__flow_borrows__int_ptr__is_null_pointer
                                                       (rec__flow_borrows__two_ptrs__f
                                                       usf1))))
  (forall ((x__split_fields1 us_split_fields))
  (=>
  (= x__split_fields1 (us_split_fieldsqtmk
                      (rec__flow_borrows__two_ptrs__f usf1)
                      (rec__flow_borrows__two_ptrs__g x__split_fields)))
  (= (to_rep
     (rec__flow_borrows__int_ptr__pointer_value
     (rec__flow_borrows__two_ptrs__f x__split_fields1))) 5)))))))))))))))))))))))))))))
(check-sat)
(exit)
