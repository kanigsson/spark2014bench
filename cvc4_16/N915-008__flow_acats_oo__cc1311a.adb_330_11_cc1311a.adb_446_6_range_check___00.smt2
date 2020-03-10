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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort character 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (character character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int character))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int character) (elts a))

(define-fun of_array ((a (Array Int character)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-fun ident_int (Int) Int)

(declare-fun ident_int__function_guard (Int Int) Bool)

;; ident_int__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (ident_int x)))
     (=> (ident_int__function_guard result x) (dynamic_invariant result true
     false true true)))) :pattern ((ident_int x)) )))

;; ident_int__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (ident_int x) x)) :pattern (
  (ident_int x)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const c474b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort numbers 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (numbers numbers) Bool)

(declare-const dummy4 numbers)

(declare-datatypes ((numbers__ref 0))
(((numbers__refqtmk (numbers__content numbers)))))
(define-fun numbers__ref_numbers__content__projection ((a numbers__ref)) numbers 
  (numbers__content a))

(define-fun dynamic_invariant1 ((temp___expr_225 Int)
  (temp___is_init_221 Bool) (temp___skip_constant_222 Bool)
  (temp___do_toplevel_223 Bool)
  (temp___do_typ_inv_224 Bool)) Bool (=>
                                     (or (= temp___is_init_221 true)
                                     (<= 0 2)) (in_range3 temp___expr_225)))

(declare-sort t1 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (t1 t1) Bool)

(declare-const dummy5 t1)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content t1)))))
(define-fun t__ref_t__content__5__projection ((a t__ref)) t1 (t__content a))

(define-fun dynamic_invariant2 ((temp___expr_627 Int)
  (temp___is_init_623 Bool) (temp___skip_constant_624 Bool)
  (temp___do_toplevel_625 Bool)
  (temp___do_typ_inv_626 Bool)) Bool (=>
                                     (or (= temp___is_init_623 true)
                                     (<= 0 2)) (in_range4 temp___expr_627)))

(declare-fun temp___String_Literal_720 (tuple0) (Array Int character))

;; temp___String_Literal_720__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 1)) 73)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 2)) 78))
     (and
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 3)) 67)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 6)) 82)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 7)) 69)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 8)) 67))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 9)) 84)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 10)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 11)) 68)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 12)) 69))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 13)) 70)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 14)) 65)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 15)) 85)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 16)) 76))
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 17)) 84))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 18)) 32)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 19)) 86))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 20)) 65)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 21)) 76)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 22)) 85)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 23)) 69))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 24)) 32)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 25)) 87))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 26)) 73)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 27)) 84))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 28)) 72)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 29)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 30)) 80)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 31)) 82))
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 32)) 79)))))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 33)) 67)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 34)) 69))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 35)) 68)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 36)) 85)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 37)) 82)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 38)) 69))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 39)) 32)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 40)) 39))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 41)) 80)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 42)) 39))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 43)) 32)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 44)) 65)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 45)) 78)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 46)) 68))
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 47)) 32))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 48)) 80)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 49)) 65))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 50)) 67)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 51)) 75)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 52)) 65)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 53)) 71))
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 54)) 69)))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 55)) 32)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 56)) 39))
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 57)) 80)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 58)) 75)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 59)) 71)
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 60)) 50))
     (= (to_rep (select (temp___String_Literal_720 us_void_param) 61)) 39))))))) :pattern (
  (temp___String_Literal_720 us_void_param)) )))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range2 temp___expr_74)))

(define-fun dynamic_invariant5 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

;; c474b__def_axiom
  (assert
  (and (ident_int__function_guard (ident_int 0) 0) (= c474b (ident_int 0))))

(assert
;; defqtvc
 ;; File "cc1311a.adb", line 446, characters 0-0
  (not
  (forall ((results Int))
  (=> (dynamic_invariant2 results false false true true)
  (let ((o (ident_int 0)))
  (=>
  (and (ident_int__function_guard o 0)
  (and (dynamic_invariant o true false true true) (= o 0))) (in_range3 o)))))))
(check-sat)
(exit)
