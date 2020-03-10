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

(declare-sort ext_account_num 0)

(declare-fun ext_account_numqtint (ext_account_num) Int)

;; ext_account_num'axiom
  (assert
  (forall ((i ext_account_num))
  (and (<= 0 (ext_account_numqtint i)) (<= (ext_account_numqtint i) 200000))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 200000)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (ext_account_num ext_account_num) Bool)

(declare-const dummy ext_account_num)

(declare-datatypes ((ext_account_num__ref 0))
(((ext_account_num__refqtmk (ext_account_num__content ext_account_num)))))
(define-fun ext_account_num__ref_ext_account_num__content__projection ((a ext_account_num__ref)) ext_account_num 
  (ext_account_num__content a))

(define-fun to_rep ((x ext_account_num)) Int (ext_account_numqtint x))

(declare-fun of_rep (Int) ext_account_num)

;; inversion_axiom
  (assert
  (forall ((x ext_account_num))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x ext_account_num)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__database__availability__account_link__available Bool)(rec__database__availability__account_link__prev ext_account_num)(rec__database__availability__account_link__next ext_account_num)))))
(define-fun us_split_fields_rec__database__availability__account_link__available__projection ((a us_split_fields)) Bool 
  (rec__database__availability__account_link__available a))

(define-fun us_split_fields_rec__database__availability__account_link__prev__projection ((a us_split_fields)) ext_account_num 
  (rec__database__availability__account_link__prev a))

(define-fun us_split_fields_rec__database__availability__account_link__next__projection ((a us_split_fields)) ext_account_num 
  (rec__database__availability__account_link__next a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (ite (rec__database__availability__account_link__available
                                (us_split_fields1 a)) 1 0) (ite (rec__database__availability__account_link__available
                                                                (us_split_fields1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__database__availability__account_link__prev
                           (us_split_fields1 a))) (to_rep
                                                  (rec__database__availability__account_link__prev
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__database__availability__account_link__next
                           (us_split_fields1 a))) (to_rep
                                                  (rec__database__availability__account_link__next
                                                  (us_split_fields1 b)))))
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

(declare-const database__availability__account_link__available__first__bit Int)

(declare-const database__availability__account_link__available__last__bit Int)

(declare-const database__availability__account_link__available__position Int)

;; database__availability__account_link__available__first__bit_axiom
  (assert (<= 0 database__availability__account_link__available__first__bit))

;; database__availability__account_link__available__last__bit_axiom
  (assert
  (< database__availability__account_link__available__first__bit database__availability__account_link__available__last__bit))

;; database__availability__account_link__available__position_axiom
  (assert (<= 0 database__availability__account_link__available__position))

(declare-const database__availability__account_link__prev__first__bit Int)

(declare-const database__availability__account_link__prev__last__bit Int)

(declare-const database__availability__account_link__prev__position Int)

;; database__availability__account_link__prev__first__bit_axiom
  (assert (<= 0 database__availability__account_link__prev__first__bit))

;; database__availability__account_link__prev__last__bit_axiom
  (assert
  (< database__availability__account_link__prev__first__bit database__availability__account_link__prev__last__bit))

;; database__availability__account_link__prev__position_axiom
  (assert (<= 0 database__availability__account_link__prev__position))

(declare-const database__availability__account_link__next__first__bit Int)

(declare-const database__availability__account_link__next__last__bit Int)

(declare-const database__availability__account_link__next__position Int)

;; database__availability__account_link__next__first__bit_axiom
  (assert (<= 0 database__availability__account_link__next__first__bit))

;; database__availability__account_link__next__last__bit_axiom
  (assert
  (< database__availability__account_link__next__first__bit database__availability__account_link__next__last__bit))

;; database__availability__account_link__next__position_axiom
  (assert (<= 0 database__availability__account_link__next__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((account_link__ref 0))
(((account_link__refqtmk (account_link__content us_rep)))))
(define-fun account_link__ref_account_link__content__projection ((a account_link__ref)) us_rep 
  (account_link__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun is_available (Int (Array Int us_rep)) Bool)

(declare-fun is_available__function_guard (Bool Int (Array Int us_rep)) Bool)

(declare-sort account_num 0)

(declare-fun account_numqtint (account_num) Int)

;; account_num'axiom
  (assert
  (forall ((i account_num))
  (and (<= 1 (account_numqtint i)) (<= (account_numqtint i) 200000))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 200000)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (account_num account_num) Bool)

(declare-const dummy2 account_num)

(declare-datatypes ((account_num__ref 0))
(((account_num__refqtmk (account_num__content account_num)))))
(define-fun account_num__ref_account_num__content__projection ((a account_num__ref)) account_num 
  (account_num__content a))

(define-fun dynamic_invariant ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 1 200000)) (in_range2
                                     temp___expr_189)))

;; is_available__post_axiom
  (assert true)

;; is_available__def_axiom
  (assert
  (forall ((account Int))
  (forall ((database__availability__links (Array Int us_rep)))
  (! (= (= (is_available account database__availability__links) true)
     (= (rec__database__availability__account_link__available
        (us_split_fields1 (select database__availability__links account))) true)) :pattern (
  (is_available account database__availability__links)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const account Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 0 200000)) (in_range1
                                     temp___expr_182)))

(assert
;; defqtvc
 ;; File "database.adb", line 48, characters 0-0
  (not
  (forall ((links (Array Int us_rep)) (first_available Int) (o Int)
  (spark__branch Bool) (o1 Int) (o2 ext_account_num) (temp___446 Int))
  (=> (dynamic_invariant1 first_available true false true true)
  (=> (dynamic_invariant account true false true true)
  (=>
  (forall ((links1 (Array Int us_rep))) (is_available__function_guard
  (is_available account links1) account links1))
  (=> (not (= (is_available account links) true))
  (=>
  (= (to_rep
     (rec__database__availability__account_link__prev
     (us_split_fields1 (select links account)))) o)
  (=> (= spark__branch (ite (= o 0) false true))
  (=> (= spark__branch true)
  (=>
  (= (to_rep
     (rec__database__availability__account_link__next
     (us_split_fields1 (select links account)))) o1)
  (=> (= (to_rep o2) o1)
  (=>
  (= (to_rep
     (rec__database__availability__account_link__prev
     (us_split_fields1 (select links account)))) temp___446)
  (<= 1 temp___446))))))))))))))
(check-sat)
(exit)
