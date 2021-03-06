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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__r__x Bool)))))
(define-fun us_split_fields_rec__foo__r__x__projection ((a us_split_fields)) Bool 
  (rec__foo__r__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (ite (rec__foo__r__x (us_split_fields1 a)) 1 0) (ite 
                   (rec__foo__r__x (us_split_fields1 b)) 1 0)) true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const foo__r__x__first__bit Int)

(declare-const foo__r__x__last__bit Int)

(declare-const foo__r__x__position Int)

;; foo__r__x__first__bit_axiom
  (assert (<= 0 foo__r__x__first__bit))

;; foo__r__x__last__bit_axiom
  (assert (< foo__r__x__first__bit foo__r__x__last__bit))

;; foo__r__x__position_axiom
  (assert (<= 0 foo__r__x__position))

(declare-fun user_eq (us_rep us_rep) Bool)

(declare-const dummy us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

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
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (bool_eq (select a temp___idx_155)
                              (select b (+ (- b__first a__first) temp___idx_155))) true))))
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
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (bool_eq (select a temp___idx_155)
     (select b (+ (- b__first a__first) temp___idx_155))) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort tctD1 0)

(declare-fun tctD1qtint (tctD1) Int)

;; tctD1'axiom
  (assert
  (forall ((i tctD1)) (and (<= 1 (tctD1qtint i)) (<= (tctD1qtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tctD1 tctD1) Bool)

(declare-const dummy1 tctD1)

(declare-datatypes ((tctD1__ref 0))
(((tctD1__refqtmk (tctD1__content tctD1)))))
(define-fun tctD1__ref_tctD1__content__projection ((a tctD1__ref)) tctD1 
  (tctD1__content a))

(declare-sort t29b 0)

(declare-fun t29bqtint (t29b) Int)

;; t29b'axiom
  (assert
  (forall ((i t29b)) (and (<= 1 (t29bqtint i)) (<= (t29bqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t29b t29b) Bool)

(declare-const dummy2 t29b)

(declare-datatypes ((t29b__ref 0))
(((t29b__refqtmk (t29b__content t29b)))))
(define-fun t29b__ref_t29b__content__projection ((a t29b__ref)) t29b 
  (t29b__content a))

(assert
;; defqtvc
 ;; File "foo.adb", line 51, characters 0-0
  (not
  (forall ((a (Array Int us_rep)) (i Int) (a1 (Array Int us_rep)) (j Int))
  (=> (= i 1)
  (=> (= (and (ite (<= 1 i) true false) (ite (<= i 10) true false)) true)
  (=>
  (= a1 (store a i (us_repqtmk
                   (us_split_fieldsqtmk
                   (or (rec__foo__r__x (us_split_fields1 (select a i))) 
                   (ite (= (rec__foo__r__x (us_split_fields1 (select a i))) true)
                   false true))))))
  (=> (<= 1 j)
  (=> (<= j i) (= (rec__foo__r__x (us_split_fields1 (select a1 j))) true)))))))))
(check-sat)
(exit)
