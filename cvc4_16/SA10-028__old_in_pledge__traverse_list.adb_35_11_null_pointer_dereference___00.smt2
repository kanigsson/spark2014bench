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
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__traverse_list__list_acc__is_null_pointer Bool)(rec__traverse_list__list_acc__pointer_address Int)(rec__traverse_list__list_acc__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__traverse_list__list_acc__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__traverse_list__list_acc__is_null_pointer a))

(define-fun us_rep_rec__traverse_list__list_acc__pointer_address__projection ((a us_rep)) Int 
  (rec__traverse_list__list_acc__pointer_address a))

(define-fun us_rep_rec__traverse_list__list_acc__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__traverse_list__list_acc__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__traverse_list__list_acc__is_null_pointer a) 
                        (rec__traverse_list__list_acc__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__traverse_list__list_acc__is_null_pointer a) true))
                        (and
                        (= (rec__traverse_list__list_acc__pointer_address a) 
                        (rec__traverse_list__list_acc__pointer_address b))
                        (= (rec__traverse_list__list_acc__pointer_value_abstr
                           a) (rec__traverse_list__list_acc__pointer_value_abstr
                              b)))))
                   true false))

(declare-const dummy1 us_rep)

(declare-datatypes ((t2b__ref 0))
(((t2b__refqtmk (t2b__content us_rep)))))
(define-fun t2b__ref_t2b__content__projection ((a t2b__ref)) us_rep (t2b__content
                                                                    a))

(declare-const dummy2 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) us_rep (t3b__content
                                                                    a))

(declare-fun tail (us_rep) us_rep)

(declare-fun tail__function_guard (us_rep us_rep) Bool)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-fun traverse_list__tail__pledge (us_rep) us_pledge_ty)

(declare-const dummy3 us_rep)

(declare-datatypes ((list_acc__ref 0))
(((list_acc__refqtmk (list_acc__content us_rep)))))
(define-fun list_acc__ref_list_acc__content__projection ((a list_acc__ref)) us_rep 
  (list_acc__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__traverse_list__list__val integer)(rec__traverse_list__list__next us_rep)))))
(define-fun us_split_fields_rec__traverse_list__list__val__projection ((a us_split_fields)) integer 
  (rec__traverse_list__list__val a))

(define-fun us_split_fields_rec__traverse_list__list__next__projection ((a us_split_fields)) us_rep 
  (rec__traverse_list__list__next a))

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
                         (= (to_rep
                            (rec__traverse_list__list__val
                            (us_split_fields1 a))) (to_rep
                                                   (rec__traverse_list__list__val
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__traverse_list__list__next
                            (us_split_fields1 a))
                            (rec__traverse_list__list__next
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

(declare-const traverse_list__list__val__first__bit Int)

(declare-const traverse_list__list__val__last__bit Int)

(declare-const traverse_list__list__val__position Int)

;; traverse_list__list__val__first__bit_axiom
  (assert (<= 0 traverse_list__list__val__first__bit))

;; traverse_list__list__val__last__bit_axiom
  (assert
  (< traverse_list__list__val__first__bit traverse_list__list__val__last__bit))

;; traverse_list__list__val__position_axiom
  (assert (<= 0 traverse_list__list__val__position))

(declare-const traverse_list__list__next__first__bit Int)

(declare-const traverse_list__list__next__last__bit Int)

(declare-const traverse_list__list__next__position Int)

;; traverse_list__list__next__first__bit_axiom
  (assert (<= 0 traverse_list__list__next__first__bit))

;; traverse_list__list__next__last__bit_axiom
  (assert
  (< traverse_list__list__next__first__bit traverse_list__list__next__last__bit))

;; traverse_list__list__next__position_axiom
  (assert (<= 0 traverse_list__list__next__position))

(declare-fun user_eq1 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep1)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep1 
  (list__content a))

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

(define-fun rec__traverse_list__list_acc__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__traverse_list__list_acc__pointer_value_abstr a)))

(define-fun rec__traverse_list__list_acc__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__traverse_list__list_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__traverse_list__list_acc__is_null_pointer us_null_pointer) true))

;; tail__post_axiom
  (assert
  (forall ((l us_rep))
  (! (let ((result (tail l)))
     (=> (tail__function_guard result l)
     (let ((us_result_pledge (traverse_list__tail__pledge l)))
     (and
     (ite (= (bool_eq l us_null_pointer) true)
     (and (= (bool_eq result us_null_pointer) true)
     (= (ite (forall ((temp___borrowed_206 us_rep))
             (forall ((temp___brower_205 us_rep))
             (! (=>
                (and
                (= (us_pledge_get us_result_pledge temp___borrowed_206
                   temp___brower_205) true)
                (and
                (= (rec__traverse_list__list_acc__is_null_pointer l) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___borrowed_206))
                (= (rec__traverse_list__list_acc__is_null_pointer result) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___brower_205))))
                (= (bool_eq temp___borrowed_206 us_null_pointer) true)) :pattern (
             (us_pledge_get us_result_pledge temp___borrowed_206
             temp___brower_205)) )))
        true false) true))
     (and
     (= (let ((temp___old_202 (to_rep
                              (rec__traverse_list__list__val
                              (us_split_fields1
                              (rec__traverse_list__list_acc__pointer_value l))))))
        (ite (forall ((temp___borrowed_201 us_rep))
             (forall ((temp___brower_200 us_rep))
             (! (=>
                (and
                (= (us_pledge_get us_result_pledge temp___borrowed_201
                   temp___brower_200) true)
                (and
                (= (rec__traverse_list__list_acc__is_null_pointer l) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___borrowed_201))
                (= (rec__traverse_list__list_acc__is_null_pointer result) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___brower_200))))
                (= (to_rep
                   (rec__traverse_list__list__val
                   (us_split_fields1
                   (rec__traverse_list__list_acc__pointer_value
                   temp___borrowed_201)))) temp___old_202)) :pattern (
             (us_pledge_get us_result_pledge temp___borrowed_201
             temp___brower_200)) )))
        true false)) true)
     (= (ite (forall ((temp___borrowed_204 us_rep))
             (forall ((temp___brower_203 us_rep))
             (! (=>
                (and
                (= (us_pledge_get us_result_pledge temp___borrowed_204
                   temp___brower_203) true)
                (and
                (= (rec__traverse_list__list_acc__is_null_pointer l) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___borrowed_204))
                (= (rec__traverse_list__list_acc__is_null_pointer result) 
                (rec__traverse_list__list_acc__is_null_pointer
                temp___brower_203))))
                (= (bool_eq
                   (rec__traverse_list__list__next
                   (us_split_fields1
                   (rec__traverse_list__list_acc__pointer_value
                   temp___borrowed_204))) temp___brower_203) true)) :pattern (
             (us_pledge_get us_result_pledge temp___borrowed_204
             temp___brower_203)) )))
        true false) true)))
     (= (us_pledge_get us_result_pledge l result) true))))) :pattern (
  (tail l)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const dummy5 us_rep)

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content us_rep)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_rep 
  (t15b__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort us_pledge_ty1 0)

(declare-datatypes ((us_pledge_ty__ref1 0))
(((us_pledge_ty__refqtmk1 (us_pledge_ty__content1 us_pledge_ty1)))))
(declare-fun us_pledge_get1 (us_pledge_ty1 us_rep us_rep) Bool)

(define-fun default_initial_assumption ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (= (rec__traverse_list__list_acc__is_null_pointer
                                            temp___expr_182) true))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun default_initial_assumption1 ((temp___expr_189 us_rep1)
  (temp___skip_top_level_190 Bool)) Bool (= (rec__traverse_list__list_acc__is_null_pointer
                                            (rec__traverse_list__list__next
                                            (us_split_fields1
                                            temp___expr_189))) true))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 3))

(assert
;; defqtvc
 ;; File "traverse_list.adb", line 1, characters 0-0
  (not
  (forall ((us_next_pointer_address Int) (traverse_list__x__assume us_rep)
  (x__pointer_value us_split_fields) (x__pointer_address Int)
  (x__is_null_pointer Bool) (us_next_pointer_address1 Int) (o us_rep)
  (x__pointer_value1 us_split_fields))
  (=>
  (= (and (ite (and
               (not
               (= (rec__traverse_list__list_acc__is_null_pointer
                  traverse_list__x__assume) true))
               (= (rec__traverse_list__list_acc__pointer_address
                  traverse_list__x__assume) us_next_pointer_address))
          true false) (ite (= (rec__traverse_list__list_acc__pointer_value
                              traverse_list__x__assume) (us_repqtmk1
                                                        (us_split_fieldsqtmk
                                                        rliteral
                                                        us_null_pointer)))
                      true false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value) (rec__traverse_list__list_acc__pointer_value
                                    traverse_list__x__assume))
  (=>
  (= x__pointer_address (rec__traverse_list__list_acc__pointer_address
                        traverse_list__x__assume))
  (=>
  (= x__is_null_pointer (rec__traverse_list__list_acc__is_null_pointer
                        traverse_list__x__assume))
  (=>
  (= (and (ite (and
               (not
               (= (rec__traverse_list__list_acc__is_null_pointer o) true))
               (= (rec__traverse_list__list_acc__pointer_address o) us_next_pointer_address1))
          true false) (ite (= (rec__traverse_list__list_acc__pointer_value o) 
                      (us_repqtmk1
                      (us_split_fieldsqtmk rliteral1 us_null_pointer))) true
                      false)) true)
  (=>
  (= (us_repqtmk1 x__pointer_value1) (rec__traverse_list__list_acc__pointer_value
                                     (us_repqtmk x__is_null_pointer
                                     x__pointer_address
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__traverse_list__list__val
                                     (us_split_fields1
                                     (rec__traverse_list__list_acc__pointer_value
                                     (us_repqtmk x__is_null_pointer
                                     x__pointer_address
                                     (us_close
                                     (us_repqtmk1 x__pointer_value)))))) o))))))
  (let ((temp___212 (rec__traverse_list__list__next
                    (us_split_fields1
                    (rec__traverse_list__list_acc__pointer_value
                    (us_repqtmk x__is_null_pointer x__pointer_address
                    (us_close (us_repqtmk1 x__pointer_value1))))))))
  (forall ((us_next_pointer_address2 Int))
  (forall ((o1 us_rep))
  (=>
  (= (and (ite (and
               (not
               (= (rec__traverse_list__list_acc__is_null_pointer o1) true))
               (= (rec__traverse_list__list_acc__pointer_address o1) us_next_pointer_address2))
          true false) (ite (= (rec__traverse_list__list_acc__pointer_value
                              o1) (us_repqtmk1
                                  (us_split_fieldsqtmk rliteral2
                                  us_null_pointer)))
                      true false)) true)
  (forall ((x__pointer_value2 us_split_fields))
  (=>
  (= (us_repqtmk1 x__pointer_value2) (rec__traverse_list__list_acc__pointer_value
                                     (us_repqtmk x__is_null_pointer
                                     x__pointer_address
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__traverse_list__list__val
                                     (us_split_fields1
                                     (rec__traverse_list__list_acc__pointer_value
                                     (us_repqtmk x__is_null_pointer
                                     x__pointer_address
                                     (us_close
                                     (us_repqtmk1 x__pointer_value1))))))
                                     (us_repqtmk
                                     (rec__traverse_list__list_acc__is_null_pointer
                                     temp___212)
                                     (rec__traverse_list__list_acc__pointer_address
                                     temp___212)
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk
                                     (rec__traverse_list__list__val
                                     (us_split_fields1
                                     (rec__traverse_list__list_acc__pointer_value
                                     (rec__traverse_list__list__next
                                     (us_split_fields1
                                     (rec__traverse_list__list_acc__pointer_value
                                     (us_repqtmk x__is_null_pointer
                                     x__pointer_address
                                     (us_close
                                     (us_repqtmk1 x__pointer_value1)))))))))
                                     o1))))))))))
  (rec__traverse_list__list_acc__pointer_value__pred
  (rec__traverse_list__list__next
  (us_split_fields1
  (rec__traverse_list__list_acc__pointer_value
  (us_repqtmk x__is_null_pointer x__pointer_address
  (us_close (us_repqtmk1 x__pointer_value2))))))))))))))))))))))
(check-sat)
(exit)
