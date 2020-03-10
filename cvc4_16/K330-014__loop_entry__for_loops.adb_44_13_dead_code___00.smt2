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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

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

(declare-sort character 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (character character) Bool)

(declare-const dummy3 character)

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
  (forall ((x character)) (! (in_range4 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
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
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun sum_of (Int) Int)

(declare-fun sum_of__function_guard (Int Int) Bool)

;; sum_of__post_axiom
  (assert
  (forall ((val__ Int)) (! (in_range1
  (sum_of val__)) :pattern ((sum_of val__)) )))

(declare-const r2b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r5b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r8b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const r10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r13b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(declare-const r15b Int)

(declare-const attr__ATTRIBUTE_ADDRESS11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS12 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (integer integer) Bool)

(declare-const dummy5 integer)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content integer)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) integer 
  (t3b__content a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (integer integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content integer)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) integer 
  (t6b__content a))

(define-fun dynamic_property3 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq7 (integer integer) Bool)

(declare-const dummy7 integer)

(declare-datatypes ((t11b__ref 0))
(((t11b__refqtmk (t11b__content integer)))))
(define-fun t11b__ref_t11b__content__projection ((a t11b__ref)) integer 
  (t11b__content a))

(define-fun dynamic_property4 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq8 (integer integer) Bool)

(declare-const dummy8 integer)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content integer)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) integer 
  (t16b__content a))

(declare-fun temp___String_Literal_192 (tuple0) (Array Int character))

;; temp___String_Literal_192__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 1)) 70)
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 2)) 111))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 3)) 114)
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 4)) 32))
     (and
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 5)) 108)
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 6)) 111)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 7)) 111)
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 8)) 112))
     (= (to_rep (select (temp___String_Literal_192 us_void_param) 9)) 115)))) :pattern (
  (temp___String_Literal_192 us_void_param)) )))

(declare-fun temp___String_Literal_195 (tuple0) (Array Int character))

;; temp___String_Literal_195__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 7)) 49)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_195 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_195 us_void_param)) )))

(declare-fun temp___String_Literal_202 (tuple0) (Array Int character))

;; temp___String_Literal_202__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 7)) 50)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 10)) 105))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 11)) 110)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 12)) 118))
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 13)) 97)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 14)) 114)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 15)) 105)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 16)) 97))
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 17)) 110))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 18)) 116)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 19)) 32))
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 21)) 105)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 22)) 100)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 23)) 32))
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 24)) 110)))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 25)) 111)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 26)) 116))
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 27)) 32)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 28)) 102)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 29)) 97)
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 30)) 105))
     (= (to_rep (select (temp___String_Literal_202 us_void_param) 31)) 108)))))) :pattern (
  (temp___String_Literal_202 us_void_param)) )))

(declare-fun temp___String_Literal_211 (tuple0) (Array Int character))

;; temp___String_Literal_211__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 7)) 51)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_211 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_211 us_void_param)) )))

(declare-fun temp___String_Literal_219 (tuple0) (Array Int character))

;; temp___String_Literal_219__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 1)) 69)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 2)) 82))
     (and
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 3)) 82)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 4)) 79))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 5)) 82)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 6)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 7)) 52)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 8)) 58))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 9)) 32)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 10)) 108))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 11)) 111)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 12)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 13)) 112)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 14)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 15)) 115)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 16)) 104))
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 17)) 111))))
     (and
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 18)) 117)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 19)) 108))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 20)) 100)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 21)) 32)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 22)) 110)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 23)) 111))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 24)) 116)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 25)) 32))))
     (and
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 26)) 101)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 27)) 120))
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 28)) 101)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 29)) 99)))
     (and
     (and
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 30)) 117)
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 31)) 116))
     (= (to_rep (select (temp___String_Literal_219 us_void_param) 32)) 101)))))) :pattern (
  (temp___String_Literal_219 us_void_param)) )))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant2 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range4 temp___expr_74)))

(define-fun dynamic_invariant3 ((temp___expr_96 us_t)
  (temp___is_init_92 Bool) (temp___skip_constant_93 Bool)
  (temp___do_toplevel_94 Bool)
  (temp___do_typ_inv_95 Bool)) Bool (=>
                                    (not (= temp___skip_constant_93 true))
                                    (dynamic_property 1 2147483647
                                    (first1 temp___expr_96)
                                    (last1 temp___expr_96))))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE9 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check9 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE9 (us_image) Int)

(declare-fun user_eq9 (count count) Bool)

(declare-const dummy9 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant5 ((temp___expr_167 Int)
  (temp___is_init_163 Bool) (temp___skip_constant_164 Bool)
  (temp___do_toplevel_165 Bool)
  (temp___do_typ_inv_166 Bool)) Bool (=>
                                     (or (= temp___is_init_163 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_167)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant5
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; r2b__def_axiom
  (assert (and (sum_of__function_guard (sum_of 3) 3) (= r2b (sum_of 3))))

;; r5b__def_axiom
  (assert (and (sum_of__function_guard (sum_of 3) 3) (= r5b (sum_of 3))))

;; r10b__def_axiom
  (assert (and (sum_of__function_guard (sum_of 5) 5) (= r10b (sum_of 5))))

;; r15b__def_axiom
  (assert (and (sum_of__function_guard (sum_of 4) 4) (= r15b (sum_of 4))))

(assert
;; defqtvc
 ;; File "for_loops.adb", line 5, characters 0-0
  (not
  (forall ((standard_in us_private) (file_system us_private)
  (standard_out us_private) (standard_err us_private) (current_in us_private)
  (current_out us_private) (current_err us_private) (counter Int)
  (standard_in1 us_private) (file_system1 us_private)
  (standard_out1 us_private) (standard_err1 us_private)
  (current_in1 us_private) (current_out1 us_private)
  (current_err1 us_private) (standard_in2 us_private)
  (file_system2 us_private) (standard_out2 us_private)
  (standard_err2 us_private) (current_in2 us_private)
  (current_out2 us_private) (current_err2 us_private)
  (standard_in3 us_private) (file_system3 us_private)
  (standard_out3 us_private) (standard_err3 us_private)
  (current_in3 us_private) (current_out3 us_private)
  (current_err3 us_private))
  (=> (= counter 1)
  (=> (dynamic_invariant counter true false true true)
  (=>
  (= (line_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (line_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (= (page_length standard_in file_system standard_out standard_err
     current_in current_out current_err) (page_length standard_in1
                                         file_system1 standard_out1
                                         standard_err1 current_in1
                                         current_out1 current_err1))
  (=>
  (forall ((counter1 Int)) (sum_of__function_guard (sum_of counter1)
  counter1))
  (=>
  (forall ((counter1 Int)) (sum_of__function_guard (sum_of counter1)
  counter1))
  (=>
  (let ((for_loops__B_1__test1__R2b__assume (sum_of 3)))
  (and
  (and (sum_of__function_guard for_loops__B_1__test1__R2b__assume 3)
  (dynamic_invariant for_loops__B_1__test1__R2b__assume true false true
  true))
  (and (= for_loops__B_1__test1__R2b__assume r2b)
  (and (dynamic_invariant r2b true false true true)
  (let ((temp___193 r2b))
  (exists ((i Int))
  (and (= i temp___193)
  (ite (= (and (ite (<= temp___193 i) true false) (ite (<= i 2) true false)) true)
  (exists ((standard_in4 us_private) (file_system4 us_private)
  (standard_out4 us_private) (standard_err4 us_private)
  (current_in4 us_private) (current_out4 us_private)
  (current_err4 us_private) (i1 Int))
  (and (< 0 (sum_of counter))
  (and
  (= (and (ite (dynamic_property1 r2b 2 i1) true false) (ite (and (<= 
                                                             r2b i1)
                                                             (<= i1 2))
                                                        true false)) true)
  (and
  (and
  (= (line_length standard_in4 file_system4 standard_out4 standard_err4
     current_in4 current_out4 current_err4) (line_length standard_in2
                                            file_system2 standard_out2
                                            standard_err2 current_in2
                                            current_out2 current_err2))
  (= (page_length standard_in4 file_system4 standard_out4 standard_err4
     current_in4 current_out4 current_err4) (page_length standard_in2
                                            file_system2 standard_out2
                                            standard_err2 current_in2
                                            current_out2 current_err2)))
  (= i1 2)))))
  (and
  (and
  (and
  (and
  (and (and (= standard_in2 standard_in1) (= file_system2 file_system1))
  (= standard_out2 standard_out1)) (= standard_err2 standard_err1))
  (= current_in2 current_in1)) (= current_out2 current_out1))
  (= current_err2 current_err1))))))))))
  (=>
  (forall ((counter1 Int)) (sum_of__function_guard (sum_of counter1)
  counter1))
  (=>
  (forall ((counter1 Int)) (sum_of__function_guard (sum_of counter1)
  counter1))
  (=>
  (let ((for_loops__B_2__test2__R5b__assume (sum_of 3)))
  (and
  (and (sum_of__function_guard for_loops__B_2__test2__R5b__assume 3)
  (dynamic_invariant for_loops__B_2__test2__R5b__assume true false true
  true))
  (and (= for_loops__B_2__test2__R5b__assume r5b)
  (and (dynamic_invariant r5b true false true true)
  (let ((temp___201 r5b))
  (exists ((i Int))
  (and (= i 2)
  (ite (= (and (ite (<= 2 i) true false) (ite (<= i temp___201) true false)) true)
  (exists ((standard_in4 us_private) (file_system4 us_private)
  (standard_out4 us_private) (standard_err4 us_private)
  (current_in4 us_private) (current_out4 us_private)
  (current_err4 us_private) (i1 Int))
  (and (< (sum_of counter) 0)
  (and
  (= (and (ite (dynamic_property2 2 r5b i1) true false) (ite (and (<= 2 i1)
                                                             (<= i1 r5b))
                                                        true false)) true)
  (and
  (and
  (= (line_length standard_in4 file_system4 standard_out4 standard_err4
     current_in4 current_out4 current_err4) (line_length standard_in3
                                            file_system3 standard_out3
                                            standard_err3 current_in3
                                            current_out3 current_err3))
  (= (page_length standard_in4 file_system4 standard_out4 standard_err4
     current_in4 current_out4 current_err4) (page_length standard_in3
                                            file_system3 standard_out3
                                            standard_err3 current_in3
                                            current_out3 current_err3)))
  (= i1 temp___201)))))
  (and
  (and
  (and
  (and
  (and (and (= standard_in3 standard_in2) (= file_system3 file_system2))
  (= standard_out3 standard_out2)) (= standard_err3 standard_err2))
  (= current_in3 current_in2)) (= current_out3 current_out2))
  (= current_err3 current_err2))))))))))
  (let ((for_loops__B_3__test3a__R8b__assume (sum_of counter)))
  (=>
  (and (sum_of__function_guard for_loops__B_3__test3a__R8b__assume counter)
  (dynamic_invariant for_loops__B_3__test3a__R8b__assume true false true
  true))
  (=> (= for_loops__B_3__test3a__R8b__assume r8b)
  (=> (dynamic_invariant r8b true false true true)
  (forall ((x Int))
  (=> (= x 1)
  (=> (= (and (ite (<= 1 x) true false) (ite (<= x r8b) true false)) true)
  (forall ((temp___loop_entry_214 Int))
  (=> (= temp___loop_entry_214 counter)
  (forall ((x1 Int))
  (=> (and (<= 1 x1) (<= x1 r8b))
  (let ((for_loops__B_3__test3b__R10b__assume (sum_of 5)))
  (=>
  (and (sum_of__function_guard for_loops__B_3__test3b__R10b__assume 5)
  (dynamic_invariant for_loops__B_3__test3b__R10b__assume true false true
  true))
  (=> (= for_loops__B_3__test3b__R10b__assume r10b)
  (=> (dynamic_invariant r10b true false true true)
  (let ((temp___209 r10b))
  (forall ((y Int))
  (=> (= y temp___209)
  (not
  (= (and (ite (<= temp___209 y) true false) (ite (<= y 3) true false)) true)))))))))))))))))))))))))))))))))
(check-sat)
(exit)
