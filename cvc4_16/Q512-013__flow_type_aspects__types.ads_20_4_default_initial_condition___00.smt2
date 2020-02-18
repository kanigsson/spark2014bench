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

(declare-fun r (tuple0) Bool)

(declare-fun r__function_guard (Bool tuple0) Bool)

(declare-fun func (tuple0) Bool)

(declare-fun func__function_guard (Bool tuple0) Bool)

;; func__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and (r__function_guard (r Tuple0) Tuple0)
     (= (= (func us_void_param) true) (= (r Tuple0) true))) :pattern (
  (func us_void_param)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__types__t3__c Bool)))))
(define-fun us_split_fields_rec__types__t3__c__projection ((a us_split_fields)) Bool 
  (rec__types__t3__c a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__types__t3__c (us_split_fields1 a)) 1 0) (ite 
                   (rec__types__t3__c (us_split_fields1 b)) 1 0)) true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const types__t3__c__first__bit Int)

(declare-const types__t3__c__last__bit Int)

(declare-const types__t3__c__position Int)

;; types__t3__c__first__bit_axiom
  (assert (<= 0 types__t3__c__first__bit))

;; types__t3__c__last__bit_axiom
  (assert (< types__t3__c__first__bit types__t3__c__last__bit))

;; types__t3__c__position_axiom
  (assert (<= 0 types__t3__c__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((t3__ref 0))
(((t3__refqtmk (t3__content us_rep)))))
(define-fun t3__ref_t3__content__projection ((a t3__ref)) us_rep (t3__content
                                                                 a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; temp___result_196'def
  (assert (r__function_guard (r Tuple0) Tuple0))

;; temp___result_197'def
  (assert (func__function_guard (func Tuple0) Tuple0))

(define-fun default_initial_assumption ((temp___expr_193 us_rep)
  (temp___skip_top_level_194 Bool)) Bool (and
                                         (= (rec__types__t3__c
                                            (us_split_fields1
                                            temp___expr_193)) (distinct 1 0))
                                         (=>
                                         (not
                                         (= temp___skip_top_level_194 true))
                                         (and (= (r Tuple0) true)
                                         (= (func Tuple0) true)))))

(declare-sort t2 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (t2 t2) Bool)

(declare-const dummy1 t2)

(declare-datatypes ((t2__ref 0))
(((t2__refqtmk (t2__content t2)))))
(define-fun t2__ref_t2__content__projection ((a t2__ref)) t2 (t2__content a))

;; temp___result_182'def
  (assert (r__function_guard (r Tuple0) Tuple0))

(define-fun dynamic_invariant ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 0 1)) (in_range1 temp___expr_180))
                                     (=> (= temp___do_toplevel_178 true)
                                     (=> (= temp___is_init_176 true)
                                     (and
                                     (not
                                     (= (distinct temp___expr_180 0) true))
                                     (= (r Tuple0) true))))))

;; temp___result_187'def
  (assert (r__function_guard (r Tuple0) Tuple0))

(define-fun dynamic_predicate ((temp___185 Int)) Bool (and
                                                      (not
                                                      (= (distinct temp___185 0) true))
                                                      (= (r Tuple0) true)))

;; temp___result_161'def
  (assert (r__function_guard (r Tuple0) Tuple0))

(define-fun type_invariant ((temp___159 Int)) Bool (= (r Tuple0) true))

(declare-sort t1 0)

(declare-fun t1qtint (t1) Int)

;; t1'axiom
  (assert
  (forall ((i t1))
  (and (<= (- 2147483648) (t1qtint i)) (<= (t1qtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t1 t1) Bool)

(declare-const dummy2 t1)

(declare-datatypes ((t1__ref 0))
(((t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a t1__ref)) t1 (t1__content a))

(define-fun dynamic_invariant1 ((temp___expr_166 Int)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (or (= temp___is_init_162 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_166)))

(assert
;; defqtvc
 ;; File "types.ads", line 2, characters 0-0
  (not
  (forall ((to1 Int) (to2 Int))
  (=> (= to1 3)
  (=> (dynamic_invariant1 to1 true false true true)
  (=> (not (= (distinct 1 0) true))
  (=> (r__function_guard (r Tuple0) Tuple0)
  (=> (= (r Tuple0) true)
  (=> (= to2 1)
  (=> (dynamic_invariant to2 true false true true)
  (=> (r__function_guard (r Tuple0) Tuple0) (= (r Tuple0) true))))))))))))
(check-sat)