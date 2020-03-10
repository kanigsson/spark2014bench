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

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-sort character 0)

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

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
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range4 low) (in_range4 high))))))

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

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
(((string____refqtmk (string____content us_t)))))
(define-fun string____ref_string____content__projection ((a string____ref)) us_t 
  (string____content a))

(define-fun dynamic_invariant ((temp___expr_96 us_t) (temp___is_init_92 Bool)
  (temp___skip_constant_93 Bool) (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range3 temp___expr_74)))

(declare-fun head (us_t) Int)

(declare-fun head__function_guard (Int us_t) Bool)

;; head__post_axiom
  (assert
  (forall ((s us_t))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (head s)))
     (=> (head__function_guard result s) (dynamic_invariant1 result true
     false true true)))) :pattern ((head s)) )))

;; head__def_axiom
  (assert
  (forall ((s us_t))
  (! (=> (dynamic_invariant s true true true true)
     (= (head s) (to_rep (select (to_array s) (first1 s))))) :pattern (
  (head s)) )))

(declare-fun tail (us_t) us_t)

(declare-fun tail__function_guard (us_t us_t) Bool)

(declare-datatypes ((t16s__ref 0))
(((t16s__refqtmk (t16s__content us_t)))))
(define-fun t16s__ref_t16s__content__projection ((a t16s__ref)) us_t 
  (t16s__content a))

;; tail__post_axiom
  (assert
  (forall ((s us_t))
  (! (=> (dynamic_invariant s true true true true)
     (let ((result (tail s)))
     (=> (tail__function_guard result s) (dynamic_invariant result true false
     true true)))) :pattern ((tail s)) )))

;; tail__def_axiom
  (assert
  (forall ((s us_t))
  (! (=> (dynamic_invariant s true true true true)
     (= (tail s) (let ((temp___175 (let ((temp___174 (last1 s)))
                                   (let ((temp___173 (+ (first1 s) 1)))
                                   (of_array (to_array s) temp___173
                                   temp___174)))))
                 (of_array (to_array temp___175) (first1 temp___175)
                 (last1 temp___175))))) :pattern ((tail s)) )))

(declare-const s1 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const s2 us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-fun slow_lcs_length (us_t us_t) Int)

(declare-fun slow_lcs_length__function_guard (Int us_t us_t) Bool)

(declare-fun temp___String_Literal_202 (tuple0) (Array Int character))

;; temp___String_Literal_202__def_axiom
  (assert true)

(declare-fun temp___String_Literal_206 (tuple0) (Array Int character))

;; temp___String_Literal_206__def_axiom
  (assert true)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range4
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "string_utilities.ads", line 13, characters 0-0
  (not
  (=> (dynamic_invariant s1 true false true true)
  (=> (dynamic_invariant s2 true false true true)
  (=>
  (not
  (= (or (bool_eq (to_array s1) (first1 s1) (last1 s1)
         (temp___String_Literal_202 Tuple0) 1 0) (bool_eq (to_array s2)
                                                 (first1 s2) (last1 s2)
                                                 (temp___String_Literal_206
                                                 Tuple0) 1 0)) true))
  (let ((o s2))
  (let ((o1 (head o)))
  (=>
  (and (head__function_guard o1 o)
  (and (dynamic_invariant1 o1 true false true true)
  (= o1 (to_rep (select (to_array o) (first1 o))))))
  (let ((o2 s1))
  (let ((o3 (head o2)))
  (=>
  (and (head__function_guard o3 o2)
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (to_rep (select (to_array o2) (first1 o2))))))
  (=> (not (= o3 o1))
  (let ((o4 s2))
  (let ((o5 s1))
  (let ((o6 (tail o5)))
  (=>
  (and (tail__function_guard o6 o5)
  (and (dynamic_invariant o6 true false true true)
  (= o6 (let ((temp___169 (of_array (to_array o5) (+ (first1 o5) 1)
                          (last1 o5))))
        (of_array (to_array temp___169) (first1 temp___169)
        (last1 temp___169))))))
  (let ((o7 (slow_lcs_length o6 o4)))
  (=> (forall ((o8 us_t)) (head__function_guard (head o8) o8))
  (=> (forall ((o8 us_t)) (head__function_guard (head o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=>
  (forall ((o8 us_t) (o9 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length (tail o9) (tail o8)) (tail o9) (tail o8)))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=>
  (forall ((o8 us_t) (o9 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length o9 (tail o8)) o9 (tail o8)))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=> (forall ((o8 us_t)) (tail__function_guard (tail o8) o8))
  (=>
  (forall ((o8 us_t) (o9 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length (tail o9) o8) (tail o9) o8))
  (=>
  (and (slow_lcs_length__function_guard o7 o6 o4)
  (and (dynamic_invariant2 o7 true false true true)
  (= o7 (ite (or
             (= (bool_eq (to_array o6) (first1 o6) (last1 o6)
                (temp___String_Literal_202 Tuple0) 1 0) true)
             (= (bool_eq (to_array o4) (first1 o4) (last1 o4)
                (temp___String_Literal_206 Tuple0) 1 0) true))
        0
        (ite (= (head o6) (head o4))
        (+ 1 (slow_lcs_length (tail o6) (tail o4)))
        (max (slow_lcs_length o6 (tail o4)) (slow_lcs_length (tail o6) o4)))))))
  (let ((o8 s2))
  (let ((o9 (tail o8)))
  (=>
  (and (tail__function_guard o9 o8)
  (and (dynamic_invariant o9 true false true true)
  (= o9 (let ((temp___169 (of_array (to_array o8) (+ (first1 o8) 1)
                          (last1 o8))))
        (of_array (to_array temp___169) (first1 temp___169)
        (last1 temp___169))))))
  (let ((o10 s1))
  (let ((o11 (slow_lcs_length o10 o9)))
  (=> (forall ((o12 us_t)) (head__function_guard (head o12) o12))
  (=> (forall ((o12 us_t)) (head__function_guard (head o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=>
  (forall ((o12 us_t) (o13 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length (tail o13) (tail o12)) (tail o13) (tail o12)))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=>
  (forall ((o12 us_t) (o13 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length o13 (tail o12)) o13 (tail o12)))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=> (forall ((o12 us_t)) (tail__function_guard (tail o12) o12))
  (=>
  (forall ((o12 us_t) (o13 us_t)) (slow_lcs_length__function_guard
  (slow_lcs_length (tail o13) o12) (tail o13) o12))
  (=>
  (and (slow_lcs_length__function_guard o11 o10 o9)
  (and (dynamic_invariant2 o11 true false true true)
  (= o11 (ite (or
              (= (bool_eq (to_array o10) (first1 o10) (last1 o10)
                 (temp___String_Literal_202 Tuple0) 1 0) true)
              (= (bool_eq (to_array o9) (first1 o9) (last1 o9)
                 (temp___String_Literal_206 Tuple0) 1 0) true))
         0
         (ite (= (head o10) (head o9))
         (+ 1 (slow_lcs_length (tail o10) (tail o9)))
         (max (slow_lcs_length o10 (tail o9))
         (slow_lcs_length (tail o10) o9)))))))
  (in_range2 (max o11 o7))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
