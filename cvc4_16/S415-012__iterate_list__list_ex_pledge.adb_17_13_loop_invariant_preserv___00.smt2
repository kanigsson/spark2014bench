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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort us_main_type 0)

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (rec__list_ex_pledge__list__is_null_pointer Bool)(rec__list_ex_pledge__list__pointer_address Int)(rec__list_ex_pledge__list__pointer_value_abstr us_main_type)))))
(define-fun us_rep_rec__list_ex_pledge__list__is_null_pointer__projection ((a us_rep)) Bool 
  (rec__list_ex_pledge__list__is_null_pointer a))

(define-fun us_rep_rec__list_ex_pledge__list__pointer_address__projection ((a us_rep)) Int 
  (rec__list_ex_pledge__list__pointer_address a))

(define-fun us_rep_rec__list_ex_pledge__list__pointer_value_abstr__projection ((a us_rep)) us_main_type 
  (rec__list_ex_pledge__list__pointer_value_abstr a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep 
  (us_rep__content a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (rec__list_ex_pledge__list__is_null_pointer a) 
                        (rec__list_ex_pledge__list__is_null_pointer b))
                        (=>
                        (not
                        (= (rec__list_ex_pledge__list__is_null_pointer a) true))
                        (and
                        (= (rec__list_ex_pledge__list__pointer_address a) 
                        (rec__list_ex_pledge__list__pointer_address b))
                        (= (rec__list_ex_pledge__list__pointer_value_abstr a) 
                        (rec__list_ex_pledge__list__pointer_value_abstr b)))))
                   true false))

(declare-const dummy3 us_rep)

(declare-datatypes ((t2s__ref 0))
(((t2s__refqtmk (t2s__content us_rep)))))
(define-fun t2s__ref_t2s__content__projection ((a t2s__ref)) us_rep (t2s__content
                                                                    a))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t1s__ref 0))
(((t1s__refqtmk (t1s__content us_rep)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) us_rep (t1s__content
                                                                    a))

(declare-fun length_aux (us_rep) Int)

(declare-fun length_aux__function_guard (Int us_rep) Bool)

;; length__post_axiom
  (assert
  (forall ((l us_rep))
  (! (let ((result (length l)))
     (=> (length__function_guard result l) (dynamic_invariant result true
     false true true))) :pattern ((length l)) )))

;; length__def_axiom
  (assert
  (forall ((l us_rep))
  (! (and
     (forall ((l1 us_rep)) (length_aux__function_guard (length_aux l1) l1))
     (= (length l) (length_aux l))) :pattern ((length l)) )))

(declare-const dummy5 us_rep)

(declare-datatypes ((t3s__ref 0))
(((t3s__refqtmk (t3s__content us_rep)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) us_rep (t3s__content
                                                                    a))

(declare-fun get_nth_val (us_rep Int) Int)

(declare-fun get_nth_val__function_guard (Int us_rep Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-const dummy6 us_rep)

(declare-datatypes ((list__ref 0))
(((list__refqtmk (list__content us_rep)))))
(define-fun list__ref_list__content__projection ((a list__ref)) us_rep 
  (list__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__list_ex_pledge__list_cell__value integer)(rec__list_ex_pledge__list_cell__next us_rep)))))
(define-fun us_split_fields_rec__list_ex_pledge__list_cell__value__projection ((a us_split_fields)) integer 
  (rec__list_ex_pledge__list_cell__value a))

(define-fun us_split_fields_rec__list_ex_pledge__list_cell__next__projection ((a us_split_fields)) us_rep 
  (rec__list_ex_pledge__list_cell__next a))

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
                            (rec__list_ex_pledge__list_cell__value
                            (us_split_fields1 a))) (to_rep
                                                   (rec__list_ex_pledge__list_cell__value
                                                   (us_split_fields1 b))))
                         (= (bool_eq
                            (rec__list_ex_pledge__list_cell__next
                            (us_split_fields1 a))
                            (rec__list_ex_pledge__list_cell__next
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

(declare-const list_ex_pledge__list_cell__value__first__bit Int)

(declare-const list_ex_pledge__list_cell__value__last__bit Int)

(declare-const list_ex_pledge__list_cell__value__position Int)

;; list_ex_pledge__list_cell__value__first__bit_axiom
  (assert (<= 0 list_ex_pledge__list_cell__value__first__bit))

;; list_ex_pledge__list_cell__value__last__bit_axiom
  (assert
  (< list_ex_pledge__list_cell__value__first__bit list_ex_pledge__list_cell__value__last__bit))

;; list_ex_pledge__list_cell__value__position_axiom
  (assert (<= 0 list_ex_pledge__list_cell__value__position))

(declare-const list_ex_pledge__list_cell__next__first__bit Int)

(declare-const list_ex_pledge__list_cell__next__last__bit Int)

(declare-const list_ex_pledge__list_cell__next__position Int)

;; list_ex_pledge__list_cell__next__first__bit_axiom
  (assert (<= 0 list_ex_pledge__list_cell__next__first__bit))

;; list_ex_pledge__list_cell__next__last__bit_axiom
  (assert
  (< list_ex_pledge__list_cell__next__first__bit list_ex_pledge__list_cell__next__last__bit))

;; list_ex_pledge__list_cell__next__position_axiom
  (assert (<= 0 list_ex_pledge__list_cell__next__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy7 us_rep1)

(declare-datatypes ((list_cell__ref 0))
(((list_cell__refqtmk (list_cell__content us_rep1)))))
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

(define-fun rec__list_ex_pledge__list__pointer_value ((a us_rep)) us_rep1 
  (us_open (rec__list_ex_pledge__list__pointer_value_abstr a)))

(define-fun rec__list_ex_pledge__list__pointer_value__pred ((a us_rep)) Bool 
  (not (= (rec__list_ex_pledge__list__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep)

;; __null_pointer__def_axiom
  (assert
  (= (rec__list_ex_pledge__list__is_null_pointer us_null_pointer) true))

;; get_nth_val__def_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (=>
     (and (dynamic_invariant2 n true true true true)
     (get_nth_val__function_guard (get_nth_val l n) l n))
     (and
     (forall ((l1 us_rep) (n1 Int)) (get_nth_val__function_guard
     (get_nth_val
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1)))
     (- n1 1))
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1)))
     (- n1 1)))
     (= (get_nth_val l n) (ite (= n 1)
                          (to_rep
                          (rec__list_ex_pledge__list_cell__value
                          (us_split_fields1
                          (rec__list_ex_pledge__list__pointer_value l))))
                          (get_nth_val
                          (rec__list_ex_pledge__list_cell__next
                          (us_split_fields1
                          (rec__list_ex_pledge__list__pointer_value l)))
                          (- n 1)))))) :pattern ((get_nth_val l n)) ))))

(declare-const l__pointer_address Int)

(declare-const l__is_null_pointer Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const dummy8 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) us_rep (t1b__content
                                                                    a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort us_pledge_ty 0)

(declare-datatypes ((us_pledge_ty__ref 0))
(((us_pledge_ty__refqtmk (us_pledge_ty__content us_pledge_ty)))))
(declare-fun us_pledge_get (us_pledge_ty us_rep us_rep) Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun default_initial_assumption ((temp___expr_163 us_rep)
  (temp___skip_top_level_164 Bool)) Bool (= (rec__list_ex_pledge__list__is_null_pointer
                                            temp___expr_163) true))

(define-fun default_initial_assumption1 ((temp___expr_170 us_rep1)
  (temp___skip_top_level_171 Bool)) Bool (= (rec__list_ex_pledge__list__is_null_pointer
                                            (rec__list_ex_pledge__list_cell__next
                                            (us_split_fields1
                                            temp___expr_170))) true))

;; length_aux__def_axiom
  (assert
  (forall ((l us_rep))
  (! (=> (length_aux__function_guard (length_aux l) l)
     (and
     (forall ((l1 us_rep)) (length_aux__function_guard
     (length_aux
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1))))
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1)))))
     (and
     (forall ((l1 us_rep)) (length_aux__function_guard
     (length_aux
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1))))
     (rec__list_ex_pledge__list_cell__next
     (us_split_fields1 (rec__list_ex_pledge__list__pointer_value l1)))))
     (= (length_aux l) (ite (= (bool_eq l us_null_pointer) true) 0
                       (ite (= (length_aux
                               (rec__list_ex_pledge__list_cell__next
                               (us_split_fields1
                               (rec__list_ex_pledge__list__pointer_value l)))) 2147483647)
                       2147483647
                       (+ 1 (length_aux
                            (rec__list_ex_pledge__list_cell__next
                            (us_split_fields1
                            (rec__list_ex_pledge__list__pointer_value l))))))))))) :pattern (
  (length_aux l)) )))

;; length_aux__post_axiom
  (assert
  (forall ((l us_rep))
  (! (let ((result (length_aux l)))
     (=> (length_aux__function_guard result l) (dynamic_invariant result true
     false true true))) :pattern ((length_aux l)) )))

;; get_nth_val__post_axiom
  (assert
  (forall ((l us_rep))
  (forall ((n Int))
  (! (and (forall ((l1 us_rep)) (length__function_guard (length l1) l1))
     (=> (and (dynamic_invariant2 n true true true true) (<= n (length l)))
     (let ((result (get_nth_val l n)))
     (=> (get_nth_val__function_guard result l n) (dynamic_invariant1 result
     true false true true))))) :pattern ((get_nth_val l n)) ))))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 0))

(assert
;; defqtvc
 ;; File "list_ex_pledge.ads", line 26, characters 0-0
  (not
  (forall ((l__pointer_value us_split_fields))
  (=>
  (forall ((l__pointer_value1 us_split_fields)) (length__function_guard
  (length
  (us_repqtmk l__is_null_pointer l__pointer_address
  (us_close (us_repqtmk1 l__pointer_value1))))
  (us_repqtmk l__is_null_pointer l__pointer_address
  (us_close (us_repqtmk1 l__pointer_value1)))))
  (=>
  (< (length
     (us_repqtmk l__is_null_pointer l__pointer_address
     (us_close (us_repqtmk1 l__pointer_value)))) 2147483647)
  (let ((o (us_repqtmk l__is_null_pointer l__pointer_address
           (us_close (us_repqtmk1 l__pointer_value)))))
  (let ((o1 (length o)))
  (=> (forall ((o2 us_rep)) (length_aux__function_guard (length_aux o2) o2))
  (=>
  (and (length__function_guard o1 o)
  (and (dynamic_invariant o1 true false true true) (= o1 (length_aux o))))
  (forall ((lgth Int))
  (=> (= lgth o1)
  (=> (dynamic_invariant lgth true false true true)
  (forall ((usf us_pledge_ty))
  (=>
  (forall ((temp___borrowed_192 us_rep))
  (forall ((temp___brower_191 us_rep))
  (! (= (= (us_pledge_get usf temp___borrowed_192 temp___brower_191) true)
     (= temp___borrowed_192 temp___brower_191)) :pattern ((us_pledge_get usf
                                                          temp___borrowed_192
                                                          temp___brower_191)) )))
  (forall ((list_ex_pledge__all_zero__t__pledge us_pledge_ty))
  (=> (= list_ex_pledge__all_zero__t__pledge usf)
  (forall ((t__pointer_value us_split_fields))
  (=>
  (= (us_repqtmk1 t__pointer_value) (rec__list_ex_pledge__list__pointer_value
                                    (us_repqtmk l__is_null_pointer
                                    l__pointer_address
                                    (us_close (us_repqtmk1 l__pointer_value)))))
  (forall ((t__pointer_address Int))
  (=> (= t__pointer_address l__pointer_address)
  (forall ((t__is_null_pointer Bool))
  (=> (= t__is_null_pointer l__is_null_pointer)
  (forall ((i Int))
  (=> (= i 0)
  (=> (dynamic_invariant i true false true true)
  (=>
  (= (not (bool_eq
          (us_repqtmk t__is_null_pointer t__pointer_address
          (us_close (us_repqtmk1 t__pointer_value))) us_null_pointer)) true)
  (let ((o2 (us_repqtmk t__is_null_pointer t__pointer_address
            (us_close (us_repqtmk1 t__pointer_value)))))
  (let ((o3 (length o2)))
  (=> (forall ((o4 us_rep)) (length_aux__function_guard (length_aux o4) o4))
  (=>
  (and (length__function_guard o3 o2)
  (and (dynamic_invariant o3 true false true true) (= o3 (length_aux o2))))
  (=> (in_range1 (- lgth i))
  (forall ((t__pointer_value1 us_split_fields) (t__pointer_address1 Int)
  (t__is_null_pointer1 Bool)
  (list_ex_pledge__all_zero__t__pledge1 us_pledge_ty) (i1 Int))
  (let ((list_ex_pledge__all_zero__t__pledge2 (us_pledge_ty__refqtmk
                                              list_ex_pledge__all_zero__t__pledge1)))
  (=>
  (forall ((t__pointer_value2 us_split_fields) (t__pointer_address2 Int)
  (t__is_null_pointer2 Bool)) (length__function_guard
  (length
  (us_repqtmk t__is_null_pointer2 t__pointer_address2
  (us_close (us_repqtmk1 t__pointer_value2))))
  (us_repqtmk t__is_null_pointer2 t__pointer_address2
  (us_close (us_repqtmk1 t__pointer_value2)))))
  (=>
  (forall ((temp___brower_232 us_rep)) (length__function_guard
  (length temp___brower_232) temp___brower_232))
  (=>
  (forall ((temp___borrowed_233 us_rep)) (length__function_guard
  (length temp___borrowed_233) temp___borrowed_233))
  (=>
  (forall ((temp___brower_232 us_rep)) (length__function_guard
  (length temp___brower_232) temp___brower_232))
  (=>
  (forall ((temp___borrowed_233 us_rep)) (length__function_guard
  (length temp___borrowed_233) temp___borrowed_233))
  (=>
  (forall ((temp___borrowed_223 us_rep) (k Int)) (get_nth_val__function_guard
  (get_nth_val temp___borrowed_223 k) temp___borrowed_223 k))
  (=>
  (forall ((temp___borrowed_213 us_rep)) (length__function_guard
  (length temp___borrowed_213) temp___borrowed_213))
  (=>
  (forall ((temp___borrowed_213 us_rep) (k Int)) (get_nth_val__function_guard
  (get_nth_val temp___borrowed_213 k) temp___borrowed_213 k))
  (=>
  (forall ((i2 Int) (temp___brower_212 us_rep) (k Int))
  (get_nth_val__function_guard (get_nth_val temp___brower_212 (- k i2))
  temp___brower_212 (- k i2)))
  (=>
  (and
  (= (- lgth i1) (length
                 (us_repqtmk t__is_null_pointer1 t__pointer_address1
                 (us_close (us_repqtmk1 t__pointer_value1)))))
  (and
  (forall ((temp___borrowed_233 us_rep))
  (forall ((temp___brower_232 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge1
        temp___borrowed_233 temp___brower_232) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_233))
     (= t__is_null_pointer1 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_232))))
     (ite (<= (length temp___brower_232) (- 2147483647 i1))
     (= (length temp___borrowed_233) (+ i1 (length temp___brower_232)))
     (= (length temp___borrowed_233) 2147483647))) :pattern ((us_pledge_get
                                                             (us_pledge_ty__content
                                                             list_ex_pledge__all_zero__t__pledge2)
                                                             temp___borrowed_233
                                                             temp___brower_232)) )))
  (and
  (forall ((temp___borrowed_223 us_rep))
  (forall ((temp___brower_222 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge1
        temp___borrowed_223 temp___brower_222) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_223))
     (= t__is_null_pointer1 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_222))))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k i1)) (= (get_nth_val temp___borrowed_223 k) 0)))) :pattern (
  (us_pledge_get (us_pledge_ty__content list_ex_pledge__all_zero__t__pledge2)
  temp___borrowed_223 temp___brower_222)) )))
  (forall ((temp___borrowed_213 us_rep))
  (forall ((temp___brower_212 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge1
        temp___borrowed_213 temp___brower_212) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_213))
     (= t__is_null_pointer1 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_212))))
     (forall ((k Int))
     (=> (and (<= (+ i1 1) k) (<= k (length temp___borrowed_213)))
     (= (get_nth_val temp___borrowed_213 k) (get_nth_val temp___brower_212
                                            (- k i1)))))) :pattern ((us_pledge_get
                                                                    (us_pledge_ty__content
                                                                    list_ex_pledge__all_zero__t__pledge2)
                                                                    temp___borrowed_213
                                                                    temp___brower_212)) ))))))
  (=>
  (= (and (ite (dynamic_invariant i1 true true true true) true false) 
  (ite (not
       (= (bool_eq
          (us_repqtmk t__is_null_pointer1 t__pointer_address1
          (us_close (us_repqtmk1 t__pointer_value1))) us_null_pointer) true))
  true false)) true)
  (forall ((t__pointer_value2 us_split_fields))
  (=>
  (= (us_repqtmk1 t__pointer_value2) (rec__list_ex_pledge__list__pointer_value
                                     (us_repqtmk t__is_null_pointer1
                                     t__pointer_address1
                                     (us_close
                                     (us_repqtmk1
                                     (us_split_fieldsqtmk rliteral
                                     (rec__list_ex_pledge__list_cell__next
                                     (us_split_fields1
                                     (rec__list_ex_pledge__list__pointer_value
                                     (us_repqtmk t__is_null_pointer1
                                     t__pointer_address1
                                     (us_close
                                     (us_repqtmk1 t__pointer_value1))))))))))))
  (forall ((usf1 us_pledge_ty))
  (=>
  (forall ((temp___borrowed_200 us_rep))
  (forall ((temp___brower_197 us_rep))
  (! (= (us_pledge_get usf1 temp___borrowed_200 temp___brower_197) (us_pledge_get
                                                                   list_ex_pledge__all_zero__t__pledge1
                                                                   temp___borrowed_200
                                                                   (us_repqtmk
                                                                   t__is_null_pointer1
                                                                   t__pointer_address1
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   (us_split_fieldsqtmk
                                                                   (rec__list_ex_pledge__list_cell__value
                                                                   (us_split_fields1
                                                                   (rec__list_ex_pledge__list__pointer_value
                                                                   (us_repqtmk
                                                                   t__is_null_pointer1
                                                                   t__pointer_address1
                                                                   (us_close
                                                                   (us_repqtmk1
                                                                   t__pointer_value2))))))
                                                                   temp___brower_197)))))) :pattern (
  (us_pledge_get usf1 temp___borrowed_200 temp___brower_197)) )))
  (forall ((list_ex_pledge__all_zero__t__pledge3 us_pledge_ty))
  (let ((list_ex_pledge__all_zero__t__pledge4 (us_pledge_ty__refqtmk
                                              list_ex_pledge__all_zero__t__pledge3)))
  (=> (= list_ex_pledge__all_zero__t__pledge3 usf1)
  (let ((temp___196 (rec__list_ex_pledge__list_cell__next
                    (us_split_fields1
                    (rec__list_ex_pledge__list__pointer_value
                    (us_repqtmk t__is_null_pointer1 t__pointer_address1
                    (us_close (us_repqtmk1 t__pointer_value2))))))))
  (forall ((t__pointer_value3 us_split_fields))
  (=>
  (= (us_repqtmk1 t__pointer_value3) (rec__list_ex_pledge__list__pointer_value
                                     temp___196))
  (forall ((t__pointer_address2 Int))
  (=>
  (= t__pointer_address2 (rec__list_ex_pledge__list__pointer_address
                         temp___196))
  (forall ((t__is_null_pointer2 Bool))
  (=>
  (= t__is_null_pointer2 (rec__list_ex_pledge__list__is_null_pointer
                         temp___196))
  (let ((o4 (+ i1 1)))
  (=> (in_range1 o4)
  (forall ((i2 Int))
  (=> (= i2 o4)
  (=>
  (= (not (bool_eq
          (us_repqtmk t__is_null_pointer2 t__pointer_address2
          (us_close (us_repqtmk1 t__pointer_value3))) us_null_pointer)) true)
  (let ((o5 (us_repqtmk t__is_null_pointer2 t__pointer_address2
            (us_close (us_repqtmk1 t__pointer_value3)))))
  (let ((o6 (length o5)))
  (=> (forall ((o7 us_rep)) (length_aux__function_guard (length_aux o7) o7))
  (=>
  (and (length__function_guard o6 o5)
  (and (dynamic_invariant o6 true false true true) (= o6 (length_aux o5))))
  (=> (in_range1 (- lgth i2))
  (=>
  (forall ((t__pointer_value4 us_split_fields) (t__pointer_address3 Int)
  (t__is_null_pointer3 Bool)) (length__function_guard
  (length
  (us_repqtmk t__is_null_pointer3 t__pointer_address3
  (us_close (us_repqtmk1 t__pointer_value4))))
  (us_repqtmk t__is_null_pointer3 t__pointer_address3
  (us_close (us_repqtmk1 t__pointer_value4)))))
  (=>
  (= (- lgth i2) (length
                 (us_repqtmk t__is_null_pointer2 t__pointer_address2
                 (us_close (us_repqtmk1 t__pointer_value3)))))
  (=>
  (forall ((temp___brower_232 us_rep)) (length__function_guard
  (length temp___brower_232) temp___brower_232))
  (=>
  (forall ((temp___borrowed_233 us_rep)) (length__function_guard
  (length temp___borrowed_233) temp___borrowed_233))
  (=>
  (forall ((temp___brower_232 us_rep)) (length__function_guard
  (length temp___brower_232) temp___brower_232))
  (=>
  (forall ((temp___borrowed_233 us_rep)) (length__function_guard
  (length temp___borrowed_233) temp___borrowed_233))
  (=>
  (forall ((temp___borrowed_233 us_rep))
  (forall ((temp___brower_232 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge3
        temp___borrowed_233 temp___brower_232) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_233))
     (= t__is_null_pointer2 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_232))))
     (ite (<= (length temp___brower_232) (- 2147483647 i2))
     (= (length temp___borrowed_233) (+ i2 (length temp___brower_232)))
     (= (length temp___borrowed_233) 2147483647))) :pattern ((us_pledge_get
                                                             (us_pledge_ty__content
                                                             list_ex_pledge__all_zero__t__pledge4)
                                                             temp___borrowed_233
                                                             temp___brower_232)) )))
  (=>
  (forall ((temp___borrowed_223 us_rep) (k Int)) (get_nth_val__function_guard
  (get_nth_val temp___borrowed_223 k) temp___borrowed_223 k))
  (=>
  (forall ((temp___borrowed_223 us_rep))
  (forall ((temp___brower_222 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge3
        temp___borrowed_223 temp___brower_222) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_223))
     (= t__is_null_pointer2 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_222))))
     (forall ((k Int))
     (=> (and (<= 1 k) (<= k i2)) (= (get_nth_val temp___borrowed_223 k) 0)))) :pattern (
  (us_pledge_get (us_pledge_ty__content list_ex_pledge__all_zero__t__pledge4)
  temp___borrowed_223 temp___brower_222)) )))
  (forall ((temp___borrowed_213 us_rep))
  (forall ((temp___brower_212 us_rep))
  (! (=>
     (and
     (= (us_pledge_get list_ex_pledge__all_zero__t__pledge3
        temp___borrowed_213 temp___brower_212) true)
     (and
     (= l__is_null_pointer (rec__list_ex_pledge__list__is_null_pointer
                           temp___borrowed_213))
     (= t__is_null_pointer2 (rec__list_ex_pledge__list__is_null_pointer
                            temp___brower_212))))
     (forall ((k Int))
     (=>
     (forall ((temp___borrowed_2131 us_rep)) (length__function_guard
     (length temp___borrowed_2131) temp___borrowed_2131))
     (=> (and (<= (+ i2 1) k) (<= k (length temp___borrowed_213)))
     (=>
     (forall ((temp___borrowed_2131 us_rep) (k1 Int))
     (get_nth_val__function_guard (get_nth_val temp___borrowed_2131 k1)
     temp___borrowed_2131 k1))
     (=>
     (forall ((i3 Int) (temp___brower_2121 us_rep) (k1 Int))
     (get_nth_val__function_guard (get_nth_val temp___brower_2121 (- k1 i3))
     temp___brower_2121 (- k1 i3)))
     (= (get_nth_val temp___borrowed_213 k) (get_nth_val temp___brower_212
                                            (- k i2))))))))) :pattern (
  (us_pledge_get (us_pledge_ty__content list_ex_pledge__all_zero__t__pledge4)
  temp___borrowed_213 temp___brower_212)) ))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
